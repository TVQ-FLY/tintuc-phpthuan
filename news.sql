-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 28, 2024 lúc 03:10 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `news`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `AdminUserName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `AdminPassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `AdminEmailId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `userType` int(11) DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `AdminUserName`, `AdminPassword`, `AdminEmailId`, `userType`, `CreationDate`, `UpdationDate`) VALUES
(1, 'son', '123', 'son@gmail.com', 1, '2023-12-13 12:57:07', '2023-12-14 09:43:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Description`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(15, 'Thời sự', 'Thời sự', '2023-12-14 01:42:15', NULL, 1),
(16, 'Giải trí', 'Giải trí', '2023-12-14 01:47:08', NULL, 1),
(17, 'Khoa học', 'Khoa học', '2023-12-14 01:54:33', '2023-12-15 16:47:38', 1),
(23, 'Bất động sản', 'Bất động sản', '2023-12-15 16:59:24', NULL, 1),
(24, 'Kinh doanh', 'Kinh doanh', '2023-12-15 17:02:38', NULL, 1),
(25, 'Du lịch', 'Du lịch', '2023-12-15 17:09:14', NULL, 1),
(27, 'Pháp luật', 'Pháp luật', '2024-01-21 03:50:19', NULL, 1),
(28, 'Sức khỏe', 'Sức khỏe', '2024-01-21 03:50:34', NULL, 1),
(29, 'Giáo dục', 'Giáo dục', '2024-01-21 03:50:43', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblcomments`
--

CREATE TABLE `tblcomments` (
  `id` int(11) NOT NULL,
  `postId` int(11) DEFAULT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `tblcomments`
--

INSERT INTO `tblcomments` (`id`, `postId`, `name`, `email`, `comment`, `postingDate`, `status`) VALUES
(18, 33, 'son', '2001sonle@gmail.com', 'Good', '2024-01-21 04:45:25', 1),
(19, 33, 'sơn', '2001sonle@gmail.com', '1234dssds', '2024-01-21 07:25:54', 1),
(20, 33, 'sơn', '2001sonle@gmail.com', '1234dssds', '2024-01-21 07:28:22', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `PageTitle` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `PageTitle`, `Description`, `PostingDate`, `UpdationDate`) VALUES
(1, 'aboutus', 'Giới thiệu', '<p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-bottom: 1.25em; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;\">Chào mừng đến với trang tin tức, nơi mà sự đa dạng và chất lượng của thông tin tin tức được đưa đến độc giả một cách toàn diện và thú vị nhất. Chúng tôi tự hào là nguồn tin tức đáng tin cậy, luôn nỗ lực mang đến những câu chuyện mới nhất và chi tiết nhất từ khắp mọi ngóc ngách của thế giới.</p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-top: 1.25em; margin-bottom: 1.25em; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;\">Tại trang tin tức, chúng tôi không chỉ làm việc để cung cấp tin tức hàng ngày, mà còn đặt ra một tiêu chí cao về chất lượng thông tin. Chúng tôi chuyển tải đến bạn những câu chuyện chân thực và phản ánh đầy đủ các khía cạnh của mỗi sự kiện.</p><p style=\"border: 0px solid rgb(217, 217, 227); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin-top: 1.25em; margin-bottom: 1.25em; color: rgb(55, 65, 81); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; white-space-collapse: preserve;\">Với đội ngũ biên tập chuyên nghiệp và nhiệt huyết, chúng tôi không chỉ theo dõi các sự kiện lớn mà còn tập trung vào những câu chuyện độc đáo và ẩn sau những con số và thống kê. Bạn sẽ không chỉ đọc được những thông tin đầu tiên về các sự kiện quan trọng, mà còn có cơ hội đàm phán và thảo luận với cộng đồng độc giả đa dạng của chúng tôi.</p>', '2021-06-29 18:30:00', '2024-01-28 13:10:55'),
(2, 'contactus', 'Liên hệ', '<p>Email: 2001sonle@gmail.com</p><p>Điện thoại: 0328229456</p><p>Địa chỉ: Bạch liêu</p>', '2021-06-29 18:30:00', '2024-01-28 13:13:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblposts`
--

CREATE TABLE `tblposts` (
  `id` int(11) NOT NULL,
  `PostTitle` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `SubCategoryId` int(11) DEFAULT NULL,
  `PostDetails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL,
  `PostUrl` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `PostImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `viewCounter` int(11) DEFAULT NULL,
  `postedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `lastUpdatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `tblposts`
--

INSERT INTO `tblposts` (`id`, `PostTitle`, `CategoryId`, `SubCategoryId`, `PostDetails`, `PostingDate`, `UpdationDate`, `Is_Active`, `PostUrl`, `PostImage`, `viewCounter`, `postedBy`, `lastUpdatedBy`) VALUES
(16, 'Việt - Trung mong muốn tăng cường giao lưu nghị viện', 15, 18, '<div>Chủ tịch Quốc hội Vương Đình Huệ và Tổng Bí thư, Chủ tịch Trung Quốc Tập Cận Bình bày tỏ mong muốn cơ quan lập pháp hai bên tăng cường giao lưu.</div><div><br></div><div>Trong cuộc hội kiến tại Nhà Quốc hội ngày 13/12, Chủ tịch Quốc hội Vương Đình Huệ đề xuất Quốc hội Việt Nam và Nhân đại Trung Quốc duy trì và tăng cường hơn nữa giao lưu, tiếp xúc cấp cao và các cấp, các ủy ban chuyên trách, nhóm nghị sĩ hữu nghị, theo thông cáo Bộ Ngoại giao.</div><div><br></div><div>Chủ tịch Quốc hội Vương Đình Huệ đề nghị hai cơ quan trên tiếp tục phát huy vai trò quan trọng trong việc xây dựng hành lang pháp lý và chính sách thông thoáng, thuận lợi; thúc đẩy hợp tác kinh tế - thương mại phát triển cân bằng, bền vững, đặc biệt là nhập khẩu nhiều hơn hàng hoá nông thuỷ sản của Việt Nam.</div><div><br></div><div>Chủ tịch Quốc hội cũng đề nghị hai bên tăng cường phối hợp tại các diễn đàn liên nghị viện quốc tế và khu vực; ủng hộ nhau đăng cai các diễn đàn, hội nghị quốc tế; thúc đẩy các cơ quan có trách nhiệm của hai nước kiểm soát và xử lý thỏa đáng bất đồng phù hợp với các thỏa thuận, nhận thức chung cấp cao và luật pháp quốc tế, nhất là Công ước của Liên Hợp Quốc về Luật Biển năm 1982.</div>', '2023-12-14 01:49:32', '2024-01-28 13:44:52', 1, 'Việt---Trung-mong-muốn-tăng-cường-giao-lưu-nghị-viện', 'DSC2474-1702472161-6517-1702472281.jpg.jpg', 14, 'son', 'son'),
(17, '10 phim điện ảnh người Việt tìm kiếm nhiều năm 2023', 16, 19, '<div>Nhà bà Nữ - Trấn Thành đạo diễn, ra mắt dịp Tết 2023 - đứng đầu danh sách phim chiếu rạp được người Việt tìm kiếm, do Google công bố hôm 11/12. Phim lấy đề tài tình cảm gia đình, xoay quanh mối quan hệ giữa mẹ với các con gái, con rể.</div><div><br></div><div>Theo ước tính của CJ - đơn vị phát hành, hai triệu lượt khán giả đến rạp xem \"Nhà bà Nữ\" trong dịp Tết Quý Mão. Tác phẩm cũng lập cột mốc là phim Việt có doanh thu một ngày cao kỷ lục (35 tỷ đồng), đồng thời có suất chiếu trong ngày cao nhất mọi thời (hơn 4.500 suất trên toàn quốc). Phim chạm đích với 460 tỷ đồng, trở thành tác phẩm ăn khách nhất lịch sử phòng vé Việt, phá kỷ lục của \"Bố già\" - cũng do Trấn Thành đồng sản xuất và đạo diễn</div><div><br></div><div>Oppenheimer\" - ra rạp hồi tháng 8 - đứng thứ hai trong danh sách. Phim xoay quanh J. Robert Oppenheimer (Cillian Murphy thủ vai), người được coi là \"cha đẻ\" của bom nguyên tử. Tác phẩm đề cập quá trình nghiên cứu ban đầu của Oppenheimer, vai trò chỉ đạo của ông đối với Dự án Manhattan và những tranh cãi trong phiên điều trần an ninh năm 1954 với những cáo buộc ông là gián điệp của Liên Xô. Toàn cầu, phim thu về 953 triệu USD, thuộc top 10 phim ăn khách nhất năm.<br></div>', '2023-12-14 01:53:09', '2024-01-21 04:05:16', 1, '10-phim-điện-ảnh-người-Việt-tìm-kiếm-nhiều-năm-2023', 'tim-nhieu-nhat-4-jpeg-3283-170-3503-4655-1702351741.jpg.jpg', 27, 'son', 'son'),
(18, 'Có thể hồi sinh khủng long từ ADN không?', 17, 20, '<p>Những con khủng long cuối cùng sống cách đây hơn 65 triệu năm nên việc khôi phục đầy đủ ADN của chúng là bất khả thi<br></p>', '2023-12-14 01:56:30', '2024-01-21 04:06:10', 1, 'Có-thể-hồi-sinh-khủng-long-từ-ADN-không?', 'KLhoisinhset-1702381697-1260-1702382397.jpg.jpg', 45, 'son', 'son'),
(25, 'Hoàng Quân muốn huy động 1.000 tỷ từ bán cổ phiếu để xây nhà ở xã hội', 23, 25, '<div>Địa ốc Hoàng Quân đang chuẩn bị chào bán 100 triệu cổ phiếu HQC thu về 1.000 tỷ đồng bổ sung vốn cho dự án Chung cư Nhà ở xã hội Thành phố Vàng và mua cổ phần.</div><div><br></div><div>Công ty cổ phần Tư vấn Thương mại Dịch vụ Địa ốc Hoàng Quân (HQC) vừa cho biết Ủy ban Chứng khoán Nhà nước đã nhận hồ sơ đăng ký chào bán cổ phiếu riêng lẻ của doanh nghiệp này.</div><div><br></div><div>Theo đó, Địa ốc Hoàng Quân sẽ chào bán riêng lẻ 100 triệu cổ phiếu (tỷ lệ phát hành 21%) cho nhà đầu tư chứng khoán chuyên nghiệp với giá 10.000 đồng một cổ phiếu, qua đó huy động 1.000 tỷ đồng. Số cổ phiếu này sẽ bị hạn chế chuyển nhượng 1 năm và ủy quyền cho Hội đồng quản trị lựa chọn thời điểm thích hợp để chào bán cổ phiếu tăng vốn.</div><div><br></div><div>Toàn bộ số tiền thu về từ đợt chào bán riêng lẻ này sẽ được Hoàng Quân dùng bổ sung vốn, nâng cao năng lực tài chính cho công ty. Trong đó, 600 tỷ đồng dùng để mua cổ phần Công ty Đầu tư Thành phố Vàng và 400 tỷ đồng còn lại sẽ mua cổ phần trong đợt chào bán cổ phiếu riêng lẻ của công ty này nhằm bổ sung vốn cho dự án Chung cư Nhà ở xã hội Thành phố Vàng.</div><div><br></div><div>Giá chào bán cổ phiếu riêng lẻ của Hoàng Quân đưa ra đang cao hơn 2,5 lần so với thị giá cổ phiếu HQC chốt phiên hôm nay (4.400 đồng).</div><div><br></div><div>Trước đó trong năm 2022, Địa ốc Hoàng Quân từng thông qua phương án chào bán riêng lẻ 100 triệu cổ phần cho nhà đầu tư chứng khoán chuyên nghiệp với giá 10.000 đồng một cổ phiếu. Mục đích cũng nhằm huy động vốn mua cổ phần của Đầu tư Thành phố Vàng. Tuy nhiên do biến động của thị trường chứng khoán nên kế hoạch này chưa được thực hiện.</div><div><br></div><div>Về dự án Chung cư nhà ở xã hội thành phố Vàng (Golden City), đây là dự án có quy mô 3,35 ha, vốn đầu tư hơn 1.776 tỷ đồng. Đây là dự án nhà ở xã hội quy mô lớn nhất tại TP Tây Ninh, đồng thời là một trong 7 dự án của Hoàng Quân nằm trong gói hỗ trợ vốn phát triển nhà ở xã hội trị giá 120.000 tỷ đồng.</div><div><br></div><div>Trong giới đầu tư bất động sản, Địa ốc Hoàng Quân nổi tiếng là doanh nghiệp chuyên phát triển các dự án nhà ở xã hội. Trong một văn bản gửi đến Bộ Xây dựng gần đây, doanh nghiệp cam kết hoàn thành ít nhất 50 dự án nhà xã hội với khoảng 50.000 căn và 10 tòa chung cư cũ tại TP HCM, Đồng Nai, Long An trong giai đoạn 2023-2030.</div><div><br></div><div>Theo báo cáo tài chính trước đó, kết quả kinh doanh nửa đầu năm nay của Hoàng Quân tương đối ảm đảm. Lũy kế 9 tháng, Địa ốc Hoàng Quân ghi nhận doanh thu 229 tỷ đồng và lãi ròng 3,5 tỷ đồng, lần lượt giảm 5% và 78% so với cùng kỳ năm trước. Như vậy, công ty này còn cách rất xa mục tiêu doanh thu 1.700 tỷ và lợi nhuận 140 tỷ của cả năm 2023.</div><div><br></div>', '2023-12-15 17:00:40', '2024-01-21 04:07:17', 1, 'Hoàng-Quân-muốn-huy-động-1.000-tỷ-từ-bán-cổ-phiếu-để-xây-nhà-ở-xã-hội', '1v3868878598552928697141134281-2277-5599-1702631825.jpg.jpg', 1, 'son', 'son'),
(26, 'Khối ngoại tiếp tục bán ròng hơn nghìn tỷ', 24, 26, '<div>Nhà đầu tư nước ngoài hôm nay xả hàng gần 1.500 tỷ đồng, cao nhất 8 phiên gần đây trong bối cảnh VN-Index có phiên giảm thứ ba liên tiếp.</div><div><br></div><div>Phiên giao dịch 15/12, nhà đầu tư nước ngoài giao dịch mạnh ở cả hai chiều khi mua vào gần 2.450 tỷ và bán ra gần 3.920 tỷ đồng. Tổng lại, chênh lệch bán và mua đạt hơn 1.470 tỷ đồng trên sàn HoSE. Đây là phiên thứ 13 liên tiếp, khối ngoại bán ròng và đạt mức cao nhất kể từ ngày 6/12.</div><div><br></div><div>Lũy kế 13 phiên, nhóm nhà đầu tư ngoại đã bán ròng hơn 7.860 tỷ đồng, cao hơn mức lũy kế của hai tháng 10 và 11 cộng lại.</div>', '2023-12-15 17:04:12', '2024-01-21 04:27:57', 1, 'Khối-ngoại-tiếp-tục-bán-ròng-hơn-nghìn-tỷ', 'quyn8556-1702630728-5286-1702630744.jpg.jpg', 3, 'son', 'son'),
(27, '12 quận nội thành TP HCM bị cắt nước', 15, 27, '<p class=\"description\" style=\"margin-bottom: 15px; padding: 0px; text-rendering: optimizelegibility; font-size: 18px; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial;\">Để thi công nâng cấp một số hạng mục tại nhà máy nước Thủ Đức, hàng chục nghìn hộ thuộc 12 quận nội thành và TP Thủ Đức sẽ bị cắt nước đêm cuối tuần.</p><p class=\"description\" style=\"margin-bottom: 15px; padding: 0px; text-rendering: optimizelegibility; line-height: 28.8px;\"><font color=\"#222222\" face=\"arial\"><span style=\"font-size: 18px;\">Nước sẽ bị cắt trong 4 giờ, từ 22h ngày 16 đến 2h ngày 17/12. Trong đó, 6 quận ở nội đô bị cắt nước toàn bộ, gồm: 1, 3, 4, 5, 10 và Phú Nhuận.</span></font></p><p class=\"description\" style=\"margin-bottom: 15px; padding: 0px; text-rendering: optimizelegibility; line-height: 28.8px;\"><font color=\"#222222\" face=\"arial\"><span style=\"font-size: 18px;\">Một số nơi khác bị cắt nước một phần, gồm các quận: 6 (phường: 1, 2, 3, 4, 5, 6, 7, 8, 11 và 12); 8 (phường 9, 10, 11, 12, 13); 11 (phường 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16); 7 (Tân Thuận Đông, Khu chế xuất Tân Thuận); Bình Thạnh (phường 1, 2, 3, 15, 17, 19, 21, 22, 24, 25); Tân Bình (phường 1, 3, 4, 5, 12).</span></font></p>', '2023-12-15 17:07:50', '2024-01-28 09:12:45', 1, '12-quận-nội-thành-TP-HCM-bị-cắt-nước', 'CongnhanNhamaynuocBO8241375616-9018-1930-1702632895.jpg.jpg', 5, 'son', 'son'),
(28, 'Phóng viên Mỹ gợi ý 5 quán ăn Hà Nội bị Michelin bỏ sót', 25, 28, '<div>Joshua Zukas, phóng viên Mỹ chuyên viết về du lịch Việt cho rằng Michelin đã bỏ sót nhiều món ngon ở Hà Nội như bún cá hay phở gà trộn.Với kinh nghiệm hơn 10 năm chuyên tìm hiểu về du lịch, ẩm thực Việt và thường xuyên ghé Hà Nội, Joshua Zukas giới thiệu trên trang Insider 5 quán ngon đường phố ở thủ đô xứng đáng được Michelin gọi tên.</div><div><br></div><div>Bún cá Sâm Cây si</div><div><br></div><div>Địa chỉ: Ngõ Trung Yên, Hoàn Kiếm</div><div><br></div><div>Giờ mở cửa: 8h-17h</div><div><br></div><div>Nằm tại ngõ Trung Yên, quận Hoàn Kiếm, bún cá Sâm Cây si là hàng ăn được nhiều thực khách trong và ngoài nước tìm đến tại khu phố cổ. Con ngõ nơi quán tọa lạc cũng là khu vực ăn uống nổi tiếng của Hà Nội với nhiều món như miến lươn, phở, bún ngan. Quán bún cá này mở cửa hơn 20 năm, thu hút thực khách trong và ngoài nước.</div><div><br></div><div>Quán nổi tiếng với món cá cuốn thịt được bà Sâm, chủ quán, chế biến theo công thức riêng học từ Huế. Với món bún, miến, nguyên liệu chính là cá rô chiên giòn, ăn cùng thì là, hành lá và các loại rau thơm. Nước dùng có vị chua thanh vì được ninh từ xương cá, nấu chung với hỗn hợp dứa, cà chua. Ngoài ra quán còn có món trộn.</div><div><br></div><div>Phở bưng Hàng Trống</div><div><br></div><div>Địa chỉ: Số 5 Hàng Trống, Hoàn Kiếm</div><div><br></div><div>Giờ mở cửa: Từ 15h đến khi bán hết</div><div><br></div><div>Quán này từng kinh doanh ở vỉa hè, hiện chuyển vào một căn nhà nhỏ trong phố cổ. Joshua Zukas chia sẻ anh ấn tượng với không gian quán ăn được bố trí tại căn phòng vừa là phòng ngủ, kết hợp phòng thờ và phòng khách của gia đình chủ quán. Điều này mang cho anh cái nhìn rõ hơn về cuộc sống của những người dân trong khu phố cổ Hà Nội.</div><div><br></div><div>Bánh cuốn nóng Hồ Tây</div><div><br></div><div>Địa chỉ: 34 Yên Phụ, Tây Hồ</div><div><br></div><div>Thời gian mở cửa: Từ 6h30 đến trưa</div><div><br></div><div>Bánh cuốn nóng cũng là món ăn không thiếu trong bản đồ món ngon đặc trưng Hà Nội. Joshua Zukas giới thiệu quán bánh cuốn nóng Hồ Tây 40 năm tuổi \"xứng đáng\" được vào danh sách Michelin. Quán phục vụ bánh cuốn hấp nóng, nhân có thịt heo và mộc nhĩ. Thực khách có thể gọi thêm bánh cuốn trứng, ăn kèm chả quế.</div><div><br></div><div>Nam du khách Mỹ cho rằng điều thú vị hơn cả việc thưởng thức món ăn này là xem đầu bếp đổ bột gạo vào nồi hấp rồi \"thoăn thoắt\" cuốn bánh cái nào cũng đều tăm tắp.</div><div><br></div><div>Joshua Zukas gợi ý thực khách sau khi dùng bữa sáng tại đây có thể ghé quán cà phê truyền thống tại số 43 Yên Phụ, quán này đã tồn tại gần một thế kỷ.</div><div><br></div><div>Phở Hạnh</div><div><br></div><div>Đia chỉ: 65 Lãn Ông, Hoàn Kiếm</div><div><br></div><div>Giờ mở cửa: 18h-23h</div><div><br></div><div>Theo Joshua Zukas, nhiều du khách nước ngoài khi nhắc đến phở Việt thường chỉ biết đến phở bò. Trong khi món phở thực chất được chia ra nhiều loại trong đó có phở gà. Món phở gà nổi tiếng ở Hà Nội lại chưa được nhắc tên trong danh sách Michelin tháng 6 vừa qua.</div>', '2023-12-15 17:11:47', '2024-01-28 11:21:40', 1, 'Phóng-viên-Mỹ-gợi-ý-5-quán-ăn-Hà-Nội-bị-Michelin-bỏ-sót', 'bunca1-1681619256-jpeg-1702543-6460-1452-1702543584.jpg.jpg', 12, 'son', 'son'),
(31, 'Cuộc hỗn chiến của 70 giang hồ bảo kê đất ở Phú Quốc', 27, 29, '<p>Nguyễn Văn Thái, tức Thái Bus, nhận bảo kê đất tranh chấp nên tập hợp nhiều băng giang hồ gây ra vụ nổ súng khiến 2 người chết, 6 người bị thương, theo cáo trạng.</p><p>Thái Bus, 36 tuổi, và gần 70 giang hồ khác bị TAND tỉnh Kiên Giang đưa ra xét xử về tội Giết người, Gây rối trật tự công cộng, Che giấu tội phạm; Tàng trữ, vận chuyển, mua bán, sử dụng trái phép vũ khí quân dụng, sáng 22/1.</p><p>Đây là vụ án gây chấn động dư luận hồi cuối năm 2022. Công an tỉnh Kiên Giang sau đó đã mở nhiều đợt truy quét tội phạm, bắt thêm hàng loạt băng nhóm xã hội đen ở Phú Quốc.</p>', '2024-01-21 04:00:37', '2024-01-21 04:28:03', 1, 'Cuộc-hỗn-chiến-của-70-giang-hồ-bảo-kê-đất-ở-Phú-Quốc', '2516-1666924944-jpeg-170579673-5065-5540-1705796742.jpg.jpg', 3, 'son', 'son'),
(32, 'Thay khớp miễn phí cho 50 bệnh nhân nghèo', 28, 30, '<p>TP HCM Đoàn bác sĩ tổ chức Operation Walk Chicago (Mỹ) cùng Bệnh viện Quân y 175 sẽ mổ thay khớp háng miễn phí cho 50 bệnh nhân nghèo, gia đình chính sách...</p><p><br></p><p>Các bác sĩ dự kiến phẫu thuật tại Bệnh viện Quân y 175 từ ngày 7 đến 13/3, cho những bệnh nhân có chỉ định thay khớp háng do hoại tử chỏm xương đùi, thoái thoái hóa khớp háng... Người bệnh được chi trả toàn bộ chi phí điều trị và phẫu thuật, chăm sóc, hướng dẫn luyện tập phục hồi chức năng sau phẫu thuật. Chi phí đi lại, tham gia khám sàng lọc, bệnh nhân tự thanh toán.</p><p><br></p><p>Mỗi cuộc phẫu thuật thay khớp háng thường tốn khoảng 100 triệu đồng. Chi phí cao nên nhiều bệnh nhân có bệnh lý khớp háng, ảnh hưởng chức năng vận động, không đủ tiền mổ.</p><p><br></p><p>Bệnh viện tiếp nhận hồ sơ từ ngày 19 đến 25/1, ưu tiên bệnh nhân có xác nhận của chính quyền địa phương thuộc hộ nghèo, hoàn cảnh khó khăn, gia đình chính sách, người có công cách mạng. Đăng ký trực tuyến hoặc đến trực tiếp phòng khám 22, Khoa Khám bệnh, Bệnh viện quân y 175, số 786 Nguyễn Kiệm, phường 3, Gò Vấp, TP HCM.</p>', '2024-01-21 04:12:51', '2024-01-28 13:30:38', 1, 'Thay-khớp-miễn-phí-cho-50-bệnh-nhân-nghèo', 'ch1-0092-1705763106-1705763211-4509-1705763397.jpg.jpg', 6, 'son', NULL),
(33, '60 đại học xét tuyển bằng học bạ năm 2024', 29, 31, '<p>Khoảng 60 trường đã công bố sử dụng học bạ để xét tuyển đại học năm nay, trong đó có các trường top đầu, trường quân đội.</p><p><br></p><p>Năm 2024, trường Đại học Ngoại thương dự kiến tuyển 4.130 sinh viên cho trụ sở chính ở Hà Nội và hai cơ sở TP HCM, Quảng Ninh. Trường sử dụng các phương thức tuyển sinh tương tự năm ngoái. Trong đó, trường xét học bạ THPT với ba nhóm: tham gia kỳ thi học sinh giỏi, khoa học kỹ thuật quốc gia; đạt giải ba trở lên kỳ thi học sinh giỏi cấp thành phố; là học sinh trường chuyên.</p><p><br></p><p>Điểm mới là với phương thức sử dụng điểm học bạ, Đại học Ngoại thương yêu cầu thí sinh phải đạt tối thiểu 24 điểm thi tốt nghiệp THPT trở lên, theo tổ hợp xét tuyển.</p><p><br></p><p>Một số trường đại học có tiếng khác cũng dùng kết quả học bạ để xét tuyển nhưng thường kết hợp với các tiêu chí khác, tương tự trường Ngoại thương. Ví dụ, trường Đại học Bách khoa, Đại học Quốc gia TP HCM có phương thức xét tuyển kết hợp ba tiêu chí gồm học lực, thành tích cá nhân, hoạt động xã hội và văn thể mỹ. Điểm học tập 6 kỳ ở bậc THPT chỉ là một trong ba thành phần của tiêu chí học tập.</p><p><br></p><p>Trong khi đó, phần lớn trường đã công bố phương thức xét tuyển học bạ chỉ sử dụng kết quả học tập 2-6 học kỳ bậc THPT. Nhiều trường xét đến hết kỳ I lớp 12 và đã mở cổng đăng ký xét tuyển như Đại học Công nghệ TP HCM, Văn Lang, Nguyễn Tất Thành, Quốc tế Hồng Bàng.</p><p><br></p><p>Một số trường như Công nghiệp Hà Nội hay Sư phạm Hà Nội 2 cho biết sẽ xét tuyển bằng học bạ nhưng chưa công bố điều kiện cụ thể. Tuy nhiên, các trường này dự kiến điều kiện tương tự năm ngoái.</p><p><br></p><p>2024 là năm đầu tiên khối trường quân đội tuyển sinh bằng học bạ (trừ Học viện Kỹ thuật Quân sự và Học viện Quân Y), với khoảng khoảng 10% chỉ tiêu. Thí sinh cần có điểm tổng kết mỗi năm THPT từ 7 trở lên, riêng các môn trong tổ hợp xét tuyển tối thiểu đạt 7,5.</p><p><br></p><p>Hiện, Ban Tuyển sinh quân sự Bộ Quốc phòng chưa công bố cách trường tuyển sinh năm nay và chỉ tiêu chi tiết từng trường.</p>', '2024-01-21 04:15:11', '2024-01-28 13:41:49', 1, '60-đại-học-xét-tuyển-bằng-học-bạ-năm-2024', '233a60122-1705487034-170548704-4915-7899-1705487066.jpg.jpg', 14, 'son', NULL),
(35, 'Tết Hà Nội trong tranh danh họa', 16, 33, '<p>Bức sơn dầu Hà Nội đón xuân của Nguyễn Ngọc Tuấn, được họa sĩ vẽ năm 1983, kích thước 70,3x98 cm. Tác phẩm tái hiện con phố Hà Nội những ngày giáp Tết, với hình ảnh người dân cầm cành đào.</p><p>Tranh thuộc triển lãm Xuân Hà Nội, diễn ra từ ngày 26/1 đến hết ngày 25/2, dịp chào năm mới và kỷ niệm 94 năm ngày thành lập Đảng Cộng sản Việt Nam. Sự kiện gồm 36 bức của các danh họa như Trần Nguyên Đán, Nguyễn Trọng Kiệm, Bùi Xuân Phái, Lê Quốc Lộc, Nguyễn Tư Nghiêm.</p><p>Họa sĩ Lệ Dung gợi không khí đặc trưng của ngày Tết với bức Chợ hoa. Tác giả vẽ tranh năm 1974, chất liệu sơn dầu, kích thước 47x56 cm, mô tả khung cảnh đông đúc, náo nhiệt của người dân tại phiên chợ hoa.</p><p>Lệ Dung, 76 tuổi, quê ở Hà Tĩnh, hiện sống ở TP HCM. Bà là hội viên Hội Mỹ thuật Việt Nam, từng đoạt giải nhì triển lãm thủ đô Hà Nội 1974, 1976, giải thưởng Hội Mỹ thuật Việt Nam 1993.</p>', '2024-01-28 09:09:16', '2024-01-28 13:36:57', 1, 'Tết-Hà-Nội-trong-tranh-danh-họa', 'xuan-1-1706346567-1706347822.jpg.jpg', 15, 'son', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblsubcategory`
--

CREATE TABLE `tblsubcategory` (
  `SubCategoryId` int(11) NOT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `Subcategory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `SubCatDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `tblsubcategory`
--

INSERT INTO `tblsubcategory` (`SubCategoryId`, `CategoryId`, `Subcategory`, `SubCatDescription`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(18, 15, 'Chính trị', 'Chính trị', '2023-12-14 01:42:39', NULL, 1),
(19, 16, 'Phim', 'Phim', '2023-12-14 01:47:26', NULL, 1),
(20, 17, 'Thường thức', 'Thường thức', '2023-12-14 01:55:45', '2023-12-15 16:47:15', 1),
(23, 21, 'aaaaaaaaa', 'aaaaaaa', '2023-12-15 16:04:40', '2023-12-15 16:04:55', 1),
(25, 23, 'Thị trường', 'Thị trường', '2023-12-15 17:00:05', NULL, 1),
(26, 24, 'Chứng khoán', 'Chứng khoán', '2023-12-15 17:03:22', NULL, 1),
(27, 15, 'Dân sinh', 'Dân sinh', '2023-12-15 17:07:02', NULL, 1),
(28, 25, 'Ẩm thực', 'Ẩm thực', '2023-12-15 17:09:40', NULL, 1),
(29, 27, 'Hồ sơ phá án', 'Hồ sơ phá án', '2024-01-21 03:55:02', NULL, 1),
(30, 28, 'Tin tức', 'Tin tức', '2024-01-21 04:12:04', NULL, 1),
(31, 29, 'Tuyển sinh', 'Tuyển sinh', '2024-01-21 04:14:26', NULL, 1),
(33, 16, 'Mỹ thuật', 'Mỹ thuật', '2024-01-28 09:07:50', NULL, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AdminUserName` (`AdminUserName`);

--
-- Chỉ mục cho bảng `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblcomments`
--
ALTER TABLE `tblcomments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `postId` (`postId`);

--
-- Chỉ mục cho bảng `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblposts`
--
ALTER TABLE `tblposts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `postcatid` (`CategoryId`),
  ADD KEY `postsucatid` (`SubCategoryId`),
  ADD KEY `subadmin` (`postedBy`);

--
-- Chỉ mục cho bảng `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD PRIMARY KEY (`SubCategoryId`),
  ADD KEY `catid` (`CategoryId`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `tblcomments`
--
ALTER TABLE `tblcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tblposts`
--
ALTER TABLE `tblposts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  MODIFY `SubCategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tblcomments`
--
ALTER TABLE `tblcomments`
  ADD CONSTRAINT `pid` FOREIGN KEY (`postId`) REFERENCES `tblposts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `tblposts`
--
ALTER TABLE `tblposts`
  ADD CONSTRAINT `tblposts_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `tblcategory` (`id`),
  ADD CONSTRAINT `tblposts_ibfk_2` FOREIGN KEY (`SubCategoryId`) REFERENCES `tblsubcategory` (`SubCategoryId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
