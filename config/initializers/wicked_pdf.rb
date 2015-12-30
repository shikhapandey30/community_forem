if Rails.env.staging? || Rails.env.production?
  exe_path = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s
else
	exe_path = COMMUNITYFOREM::CONFIG::WKHTMTTOPDF_PATH
end

WickedPdf.config = {
  wkhtmltopdf: exe_path,
  exe_path: exe_path
}