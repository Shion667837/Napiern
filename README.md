# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

<div class="wrapper">
  <nav id="sidebar">
    <% if logged_in? %>
      <div class="sideber-main-host">
        <div class="sidebar-header">
          <% if @current_user.image_name? %>
            <%= image_tag @current_user.image_name.url %>
          <% else %>
            <%= image_tag "/user_images/default.png" %>
          <% end %>
        </div>
        <div class="sidebar-host">
          <%= @current_user.name %>
        </div>
        <div class="side-stats">
          <%= render 'shared/side_stats' %>
        </div>
        <div class="sidebar-body">
          <%= @current_user.body %>
        </div>
        <div class="sidebar-sns">
          <% if @current_user.twitter.present? %>
            <div class="profile-link">
              <%= link_to @current_user.twitter, target: :_blank do %>
                <i class="fab fa-twitter-square"></i>
              <% end %>
            </div>
          <% end %>
          <% if @current_user.facebook.present? %>
            <div class="profile-link">
              <%= link_to @current_user.facebook, target: :_blank do %>
                <i class="fab fa-facebook-square"></i>
              <% end %>
            </div>
          <% end %>
          <% if @current_user.instagram.present? %>
            <div class="profile-link">
              <%= link_to @current_user.instagram, target: :_blank do %>
                <i class="fab fa-instagram"></i>
              <% end %>
            </div>
          <% end %>
        </div>
        <div class="sidebar-btn">
          <div class="btn btn-primary">
            <%= link_to "プロフィール編集", @current_user %>
          </div>
        </div>
        <div class="sidebar-btn">
          <div class="post-btn">
            <%= link_to posts_new_path do %>
              <i class="fas fa-share-square"></i>
            <% end %>
          </div>
        </div>
      </div>
      <ul class="list-unstyled components">
        <%= link_to index_path do %>
          <li class="post-list">
            <i class="far fa-clipboard"></i>
            <p>投稿一覧</p>
          </li>
        <% end %>
        <%= link_to favorites_index_path do %>
          <li class="favorite-coop">
            <i class="far fa-star"></i>
            <p>お気に入り企業</p>
          </li>
        <% end %>
        <li class="popular-post">
          <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
            <i class="fas fa-crown"></i>
            <p>人気投稿ランキング</p>
          </a>
          <ul class="collapse list-unstyled" id="pageSubmenu">
            <li>
              <%= link_to '全体', posts_post_ranking_path %>
            </li>
            <li>
              <%= link_to '週間', posts_week_ranking_path %>
            </li>
            <li>
              <%= link_to '月間', posts_month_ranking_path %>
            </li>
          </ul>
        </li>
        <li class="adn-napier">
          <i class="fab fa-adn"></i>
          Napierとは
        </li>
        <li class="terms">
          <i class="fas fa-users-cog"></i>
          利用規約
        </li>
        <li class="help-rink">
          <i class="fas fa-question"></i>
          ヘルプ
        </li>
        <li class="active coop-list">
          <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
            <i class="far fa-building"></i>
            <p>企業一覧</p>
          </a>
          <ul class="collapse list-unstyled" id="homeSubmenu">
            <div class="search-area">
              <form>
                <input type="text" id="search-text" placeholder="検索ワードを入力">
              </form>
              <div class="search-result">
                <div class="search-result__hit-num"></div>
                <div id="search-result__list"></div>
              </div>
            </div>
            <ul class="target-area">
              <li>
                <a class="tesla" href="companies/1">TESLA</a>
              </li>
              <li>
                <a class="tesla" href="companies/2">Apple</a>
              </li>
              <li>
                <a class="tesla" href="companies/3">Google</a>
              </li>
              <li>
                <a class="tesla" href="companies/4">Amazon</a>
              </li>
              <li>
                <a class="tesla" href="companies/5">NETFLIX</a>
              </li>
            </ul>
          </ul>
        </li>
      </ul>
    <% end %>
  </nav>
</div>



.sidebar-header {
  padding: 100px 50px 40px 50px;
}

.sidebar-header img {
  width: 145px;
  height: 145px;
  border-radius: 40%;
  object-fit: cover;
  padding: 0px;
}

.sidebar-host {
  font-size: 30px;
  padding: 0 50px;
  text-align: center;
}

.sidebar-body {
  width: 100%;
  height: 100px;
  padding: 20PX 0;
  overflow-wrap:  break-word;
  text-align: center;
}

.sidebar-sns {
  width: 65%;
	margin: 15px auto;
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: space-around;
	border-top: 1px solid #dddddd;
	padding-top: 15px;
}

.sidebar-sns li {
  text-decoration: none;
}

.sidebar-sns .profile-link {
  font-size: 20px;
	line-height: 100%;
}

.sidebar-btn {
  padding: 15px 0;
  text-align: center;
}

.sidebar-btn a {
  color: #F6F8F9;
}

.post-btn {
  display: inline-block;
  margin-bottom: 0;
  font-weight: normal;
  cursor: pointer;
  border: 1px solid transparent;
  padding: 10px 13px;
  font-size: 14px;
  border-radius: 100%;
  color: #fff;
  background-color: #337ab7;
  border-color: #2e6da4;
}

#sidebar.active {
  margin-left: -250px;
}

.active a {
  color: #111;
}

.list-unstyled {
  align-items: center;
  border-top: 1px solid #bbb;
}

.list-unstyled li:hover {
  opacity: 2;
  background-color: #bbb;
}

.list-unstyled li a {
  color: #111;
}


.favorite-coop {
  padding: 10px 0;
  height: 50px;
  text-align: left;
}

.favorite-coop i {
  float: left;
}

.favorite-coop p {
  float: left;
  padding-left: 20px;
}

.popular-post {
  padding: 10px 0;
  height: 50px;
  border-bottom: 1px solid #bbb;
}

.popular-post svg {
  float: left;
}

.popular-post p {
  float: left;
  padding-left: 20px;
}

.coop-list {
  padding: 10px 0;
  height: 50px;
}

.coop-list .dropdown-toggle i {
  float: left;
}

.coop-list p {
  float: left;
  padding-left: 20px;
}

.post-list {
  padding: 10px 0;
  height: 50px;
}

.post-list i {
  float: left;
}

.post-list p {
  float: left;
  padding-left: 20px;
}

.abn-napier {
  padding: 10px 0;
  height: 50px;
}

.terms {
  padding: 10px 0;
  height: 50px;
}

.help-rink {
  padding: 10px 0;
  height: 50px;
  border-bottom: 1px solid #bbb;
}


a[data-toggle="collapse"] {
  position: relative;
  text-decoration: none;
}

.dropdown-toggle::after {
  display: block;
  position: absolute;
  top: 50%;
  right: 20px;
  transform: translateY(-50%);
}

@media (max-width: 768px) {
  #sidebar {
      margin-left: -250px;
  }
  #sidebar.active {
      margin-left: 0;
  }
}

.search-area input[type="text"] {
  padding: 5px 5px 3px;
  border: 1px solid #D6D6D6;
}

.search-area input[type="text"]:focus {
  background: #F9F9F9;
}

.search-result {
  margin-top: 20px;
}

.search-result__hit-num span {
  font-weight: bold;
}

#search-result__list {
  margin-top: 15px;
}

#search-result__list a {
  display: inline-block;
  margin-right: 15px;
  padding: 5px;
  background: #fff;
  font-size: 30px;
}

.target-area {
  margin-top: 50px;
  list-style: none;
}

.target-area li {
  font-size: 30px;
  padding: 20px 0;
}

.target-area li a {
  text-decoration:none;
}