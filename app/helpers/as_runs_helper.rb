  module AsRunsHelper
  require 'spreadsheet'

    def get_file_path(attachmentPath)

      filePath = Rails.root.join "public" + attachmentPath
    end

    def file_name_for_xlsx(as_run)
      # file_name = "#{as_run.id}_#{DateTime.now}.xlsx"
      file_name = "#{as_run.name}_#{as_run.id}.xls"
    end

    def file_path_for_xlsx(as_run)

      path = Rails.root.join "public" + as_run.attachment_url[/.*\//]
      # path = "/Users/tk-lpt-0019/Desktop/"
      path = path + file_name_for_xlsx(as_run)
    end

    def exportFileToSheet(as_run)

      file_path = file_path_for_xlsx as_run

      if File.exist?(file_path)
        send_file file_path
        return
      end

      book = Spreadsheet::Workbook.new
      overview_sheet = book.create_worksheet(:name => 'Log')
      over_view overview_sheet, as_run


      # file_path = "#{group.title.gsub(" ", "-")}-#{DateTime.now}.xlsx"
      # group_admin_email = "muhammad.ibraheem@tkxel.com"
      abc = book.write "#{file_path}"

      send_file file_path
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

      # sheet.row(1).replace [ 'C', 'Email', 'Firstname', 'Surname',
      #                        'DOB', 'Contact No', 'Gender', 'Age',
      #                        'Reason To Exclude']

      row_index = 2
      as_run.logs.each_with_index do |log, index|

        sheet[row_index,0] = log.c1
        sheet[row_index,1] = log.c2
        sheet[row_index,2] = log.c3
        sheet[row_index,3] = log.c4
        sheet[row_index,4] = log.c5
        sheet[row_index,5] = log.c6
        sheet[row_index,6] = log.c7
        sheet[row_index,7] = log.c8
        sheet[row_index,8] = log.c9
        sheet[row_index,9] = log.c10
        sheet[row_index,10] = log.c11
        sheet[row_index,11] = log.c12
        sheet[row_index,12] = log.c13

        row_index = row_index + 1
      end
    end

  def saveFileDetail as_run

    filePath = get_file_path as_run.attachment_url
    arrayFile = IO.readlines(filePath)

    log_records = []
    arrayFile.each do |line|

      lineToArray = line.gsub(/\s\s+/m, '--**--').strip.split("--**--")

      if lineToArray[5] != "NONE"

        lineToArray.insert(5, "")
      end

      if lineToArray.length == 8
        split6 = lineToArray[7].split(' ')
        if split6.length == 2
          lineToArray[7] = split6[0]
          lineToArray << split6[1]
        end
      end

      if lineToArray[8] == nil
        puts lineToArray[8]
      end

      # if lineToArray[8] != nil

      lastItem = lineToArray.length - 1
      if lineToArray[lastItem].length == 13
        c11Value = ''
        c12Value = lineToArray[lastItem].slice(0...11)
        c13Value = lineToArray[lastItem].slice(11...lineToArray[lastItem].length)
      else
        c11Value = lineToArray[lastItem].slice(0...11)
        c12Value = lineToArray[lastItem].slice(11...22)
        c13Value = lineToArray[lastItem].slice(22...lineToArray[lastItem].length)
      end
      # end



      params = {c1: lineToArray[0].to_i,

                c2: lineToArray[1].slice(0...10),
                c3: lineToArray[1].slice(10...21),
                c4: lineToArray[1].slice(21...lineToArray[1].length),

                c5: lineToArray[2],
                c6: lineToArray[3],

                # mcvs none
                c7: lineToArray[4],
                c8: lineToArray[5],

                c9: lineToArray[6],
                c10: lineToArray[7],

                c11: c11Value,
                c12: c12Value,
                c13: c13Value,
                as_run_id: as_run.id
      }
      log_records << Log.new(params)
      # log_records << Log.create(params)
      # logs = Log.create(params)
      # logs.save
    end

    Log.import log_records
    puts arrayFile
  end


#     -----------------
#
# def saveFileDetail as_run
#
#     filePath = get_file_path as_run.attachment_url
#     arrayFile = IO.readlines(filePath)
#
#     arrayFile.each do |line|
#
#       lineToArray = line.gsub(/\s\s+/m, '--**--').strip.split("--**--")
#
#       if lineToArray[5] != "NONE"
#
#         lineToArray.insert(5, "")
#       end
#
#       if lineToArray.length == 8
#         split6 = lineToArray[7].split(' ')
#         if split6.length == 2
#           lineToArray[7] = split6[0]
#           lineToArray << split6[1]
#         end
#       end
#
#       if lineToArray[8] == nil
#         puts lineToArray[8]
#       end
#
#       # if lineToArray[8] != nil
#
#       lastItem = lineToArray.length - 1
#       if lineToArray[lastItem].length == 13
#         c11Value = ''
#         c12Value = lineToArray[lastItem].slice(0...11)
#         c13Value = lineToArray[lastItem].slice(11...lineToArray[lastItem].length)
#       else
#         c11Value = lineToArray[lastItem].slice(0...11)
#         c12Value = lineToArray[lastItem].slice(11...22)
#         c13Value = lineToArray[lastItem].slice(22...lineToArray[lastItem].length)
#       end
#       # end
#
#
#
#       params = {c1: lineToArray[0].to_i,
#
#                 c2: lineToArray[1].slice(0...10),
#                 c3: lineToArray[1].slice(10...21),
#                 c4: lineToArray[1].slice(21...lineToArray[1].length),
#
#                 c5: lineToArray[2],
#                 c6: lineToArray[3],
#
#                 # mcvs none
#                 c7: lineToArray[4],
#                 c8: lineToArray[5],
#
#                 c9: lineToArray[6],
#                 c10: lineToArray[7],
#
#                 c11: c11Value,
#                 c12: c12Value,
#                 c13: c13Value,
#                 as_run_id: as_run.id
#       }
#
#
#       logs = Log.create(params)
#       logs.save
#     end
#
#     puts arrayFile
#   end
end
