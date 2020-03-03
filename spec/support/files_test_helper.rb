module FilesTestHelper
  extend self
  extend ActionDispatch::TestProcess


  def jpg_name; 'test.jpg' end
  def jpg; upload(jpg_name, 'image/jpg') end

  def pdf_name; 'test.pdf' end
  def pdf; upload(pdf_name, 'application/pdf') end

  def docx_name; 'test.docx' end
  def docx; upload(docx_name, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document') end

  private

  def upload(name, type)
    file_path = Rails.root.join('spec', 'fixtures', name)
    fixture_file_upload(file_path, type)
  end
end
