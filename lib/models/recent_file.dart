class RecentFile {
  final String? icon, title, date, size;

  RecentFile({this.icon, this.title, this.date, this.size});
}

List demoRecentFiles = [
  RecentFile(
    icon: "assets/icons/xd_file.svg",
    title: "Outlet water eco temp(°C)",
    date: "01-03-2021",
    size: "134.7",
  ),
  RecentFile(
    icon: "assets/icons/Figma_file.svg",
    title: "Flue gas inlet eco temp(°C)",
    date: "27-02-2021",
    size: "144.2",
  ),
  RecentFile(
    icon: "assets/icons/doc_file.svg",
    title: "Combustion temp(°C)",
    date: "23-01-2025",
    size: "145.3",
  ),
  RecentFile(
    icon: "assets/icons/sound_file.svg",
    title: "Screw feed temp1(°C)",
    date: "21-01-2025",
    size: "90.0",
  ),
  RecentFile(
    icon: "assets/icons/media_file.svg",
    title: "Inlet water eco temp(°C)",
    date: "23-01-2025",
    size: "42.3",
  ),
  RecentFile(
    icon: "assets/icons/pdf_file.svg",
    title: "Screw feed temp2(°C)",
    date: "25-01-2025",
    size: "56.2",
  ),
  RecentFile(
    icon: "assets/icons/excel_file.svg",
    title: "Flue gas inlet air-pre temp(°C)",
    date: "25-01-2025",
    size: "60.7",
  ),
];
