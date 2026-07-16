class AnnouncementsController < ApplicationController

  #only: [...]は指定したアクションの前だけ実行する:set_announcementを実行する
  before_action :set_announcement, only: [:show,:edit,:update,:destroy]

  # 一覧画面
  def index
    @announcements = Announcement.all
  end

  # 新規登録画面を表示するアクション
  def new
    @announcement = Announcement.new
  end

  def show
     # before_actionの処理により、ここでは自動的に @announcement が使えます
  end

  def destroy
    # 取得したお知らせデータをデータベースから削除
    @announcement.destroy

    # 削除後に一覧画面へリダイレクトし、メッセージを表示
    redirect_to announcements_path, notice: 'お知らせを削除しました。'
  end

  # 画面から送信されたデータをデータベースに保存するアクション
  def create
    @announcement = Announcement.new(announcement_params)

    if @announcement.save
      # 保存に成功したら一覧画面へリダイレクトし、メッセージを表示
      redirect_to announcements_path, notice: 'お知らせを登録しました。'
    else
      # 保存に失敗したら登録画面を再表示
      render :new, status: :unprocessable_entity
    end
  end

   # 編集画面を表示するアクション
  def edit
    # before_action により、すでに @announcement にデータが入っています
  end

   # 更新処理を行うアクション
  def update
    # フォームから届いた安全なデータ（params）でレコードを更新する
    if @announcement.update(announcement_params)
      # 更新に成功したら詳細画面へリダイレクトし、メッセージを表示
      redirect_to announcement_path(@announcement), notice: 'お知らせを更新しました。'
    else
      # 更新に失敗したら編集画面を再表示
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # URLのID（params[:id]）から該当するお知らせを1件取得する共通メソッド
  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  # 安全にデータを受け取るためのストロングパラメータ
  #announcementのtitleとcontentだけを通す
  def announcement_params
    params.require(:announcement).permit(:title, :content)
  end

end