module AsRunsHelper

  def get_file_path(attachmentPath)

    filePath = Rails.root.join "public" + attachmentPath
  end

  def file_name_for_xlsx(as_run)
    file_name = "#{as_run.id}_#{DateTime.now}.xlsx"
  end

  def file_path_for_xlsx(as_run)

    path = Rails.root.join "public" + as_run.attachment_url[/.*\//]
    path = path + file_name_for_xlsx(as_run)
  end

  def exportFileToSheet(as_run)

    book = Spreadsheet::Workbook.new
    overview_sheet = book.create_worksheet(:name => 'OVERVIEW')
    over_view overview_sheet, as_run

    file_path = file_path_for_xlsx as_run
    # file_path = "#{group.title.gsub(" ", "-")}-#{DateTime.now}.xlsx"
    # group_admin_email = "muhammad.ibraheem@tkxel.com"
    abc = book.write "{file_path}"
    file_name = file_name_for_xlsx as_run
  end

  def over_view(sheet, as_run)
# begin
    format1 = Spreadsheet::Format.new ({:horizontal_align => :centre,
                                        :weight=> :bold,
                                        :color => :black,
                                        :pattern_fg_color => :silver,
                                        :pattern => 1,
                                        :border => :thin})
    format2 = Spreadsheet::Format.new ({:horizontal_align => :centre,
                                        :weight=> :bold,
                                        :border => :thin})
    # lessons = group.get_lessons

    sheet.row(1).replace [ 'Id', 'Email', 'Firstname', 'Surname',
                           'DOB', 'Contact No', 'Gender', 'Age',
                           'Reason To Exclude']

#TODO: wellness score
##score_cells = get_wellness_scores_cells(sheet, group, 9, format1, format2)

#TODO: lesson Date
##lesson_date_cell = get_lessons_date_cells(sheet, group, score_cells, format2 )
# post_experience_cell = get_post_experience_cells(sheet, group, lesson_date_cell, format2 )

    # questions_cell = get_questions_cells(sheet, group, 9, format2 )

#     row_index = 2
#     profiles.each_with_index do |profile, index|
#       if profile.user.present?
# # begin
#         event_progress = UserEventProgress.new(profile.user, profile.group_profile_mappings.first.group.events.first)
#         event_info = UserEventInfo.find_by_profile_id(profile)
#         sheet[row_index, 0] = "INT- #{profile.id}"
#         sheet[row_index, 1] = profile.email
#         sheet[row_index, 2] = profile.first_name
#         sheet[row_index, 3] = profile.last_name
#         sheet[row_index, 4] = (profile.dob.strftime("%d/%m/%Y") if profile.dob)
#         sheet[row_index, 5] = profile.contact
#         sheet[row_index, 6] = gender(profile)
#         sheet[row_index, 7] = (age(profile.dob).to_i if profile.dob)
#         sheet[row_index, 8] = "NA"
#
#         row_index = row_index + 1
#
#       end
    end
end
