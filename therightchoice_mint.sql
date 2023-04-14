-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 13, 2023 at 11:26 AM
-- Server version: 10.3.38-MariaDB
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `therightchoice_mint`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `balance` varchar(191) NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `greeting` varchar(191) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `group` varchar(191) NOT NULL,
  `recipient` varchar(191) DEFAULT NULL,
  `addresses` text DEFAULT NULL,
  `params` text DEFAULT NULL,
  `shortcut` text DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `slug`, `subject`, `greeting`, `content`, `group`, `recipient`, `addresses`, `params`, `shortcut`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Investment Order Placed', 'investment-placed-customer', 'Invest on [[plan_name]] ([[order_id]])', 'Hello [[user_name]],', 'Thank you! You have invested the amount of [[invest_amount]] on \'[[plan_name]]\'. Your investment details are shown below for your reference:\n[[invest_details]] \n\nYour investment plan will start as soon as we have review and confirmed. \n\nFeel free to contact us if you have any questions.', 'investments', 'customer', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_time]], [[plan_name]], [[invest_amount]], [[invest_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(2, 'Investment Order Placed', 'investment-placed-admin', 'Investment Plan ([[order_id]]) Purchased', 'Hello Admin,', 'A new investment plan purchased by [[order_by]]. The investment details as follows: \n[[invest_details]] \n\nCustomer Details:\n[[user_detail]] \n\nThis is an automatic email confirmation, please check full order details in dashboard.\n\nThank You.', 'investments', 'admin', NULL, '{\"regards\":\"off\"}', '[[user_detail]], [[order_id]], [[order_by]], [[plan_name]], [[order_time]], [[invest_amount]], [[invest_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(3, 'Investment Order Approved', 'investment-approved-customer', 'Investment plan ([[order_id]]) just started!', 'Dear [[user_name]],', 'Congratulations! Your investment plan ([[order_id]]) approved and successfully started. \nYour investment details are shown below for your reference:\n[[invest_details]]\n\nIf you have any question, you can contact us at [[site_email]].', 'investments', 'customer', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_time]], [[plan_name]], [[invest_amount]], [[invest_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(4, 'Investment Order Approved', 'investment-approved-admin', 'Investment plan ([[order_id]]) just started!', 'Dear Admin,', 'The investment order ([[order_id]]) has been approved and started. The investment details as follows: \n[[invest_details]] \n\nPS. Do not reply to this email.\nThank you.', 'investments', 'admin', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_time]], [[plan_name]], [[invest_amount]], [[invest_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(5, 'Investment Cancelled by User', 'investment-cancel-user-customer', 'Investment plan ([[order_id]]) has been cancelled!', 'Dear [[user_name]],', 'You have cancelled your investment plan ([[order_id]]). The amount returned to your account balance. \n\nIf you want to invest again, please feel free to login into your account and choose a plan once again.\n\n\nIf you have any question, you can contact us at [[site_email]].', 'investments', 'customer', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_time]], [[plan_name]], [[invest_amount]], [[invest_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(6, 'Investment Cancelled by User', 'investment-cancel-user-admin', 'Investment plan ([[order_id]]) successfully cancelled!', 'Dear Admin,', 'The recent investment plan ([[order_id]]) has been cancelled by [[order_by]]. The invested amount returned to user\'s account balance. \n\n\nThis is an automatic email confirmation, no further action is needed.\n\nPS. Do not reply to this email.\nThank you.', 'investments', 'admin', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_time]], [[plan_name]], [[invest_amount]], [[invest_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(7, 'Investment Cancelled by Admin', 'investment-cancel-customer', 'Investment plan ([[order_id]]) has been cancelled!', 'Dear [[user_name]],', 'Your recent investment plan ([[order_id]]) has been cancelled. The invested amount returned to your account balance. \n\nIf you want to invest again, please feel free to login into your account and choose a plan once again.\n\n\nIf you have any question, you can contact us at [[site_email]].', 'investments', 'customer', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_time]], [[plan_name]], [[invest_amount]], [[invest_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(8, 'Investment Cancelled by Admin', 'investment-cancel-admin', 'Investment plan ([[order_id]]) successfully cancelled!', 'Dear Admin,', 'The investment order ([[order_id]]) has been cancelled. The invested amount returned to user\'s account balance. \n\nPS. Do not reply to this email.\nThank you.', 'investments', 'admin', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_time]], [[plan_name]], [[invest_amount]], [[invest_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(9, 'Investment Cancellation by Admin', 'investment-cancellation-customer', 'Investment Cancellation ([[order_id]])', 'Dear [[user_name]],', 'We are sorry to inform you that we\'ve cancelled your investment plan of ([[plan_name]]). We have settlement your investment account balance. Please login into your account and check your account balance.\n\n\nIf you have any question about cancellation, please feel free to contact us.\n\nPS. Do not reply to this email.\nThank you.', 'investments', 'customer', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_time]], [[plan_name]], [[invest_amount]], [[invest_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(10, 'Investment Cancellation by Admin', 'investment-cancellation-admin', 'Investment Cancellation ([[order_id]])', 'Dear [[user_name]],', 'The investment plan of ([[plan_name]] - [[order_id]]) has been cancelled. User account balance adjusted with invested amount.\n\nPS. Do not reply to this email.\nThank you.', 'investments', 'admin', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_time]], [[plan_name]], [[invest_amount]], [[invest_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(11, 'Email Confirmation', 'users-confirm-email', 'Verify Your Email Address - [[site_name]]', 'Welcome [[user_name]]!', 'Thank you for registering on our platform. You\'re almost ready to start.\n\nSimply click the button below to confirm your email address and active your account.', 'authentication', 'customer', NULL, '{\"regards\":\"on\"}', '', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(12, 'Welcome Email', 'users-welcome-email', 'Welcome to [[site_name]]', 'Hi [[user_name]],', 'Thanks for joining our platform! \n\nAs a member of our platform, you can mange your account, buy or sell cryptocurrency. \n\nFind out more about in - [[site_url]]', 'authentication', 'customer', NULL, '{\"regards\":\"on\"}', '', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(13, 'Password Reset by User', 'users-reset-password', 'Password Reset Request on [[site_name]]', 'Hi [[user_name]],', '<strong>You told us you forgot your password.</strong> \n\nIf you really forgot, click the below button to reset your password. \n\nIf you did not make reset request, then you can just ignore this email; your password will not change.', 'authentication', 'customer', NULL, '{\"regards\":\"on\"}', '', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(14, 'Password Changed Successfully', 'users-change-password-success', 'Your Password Has Been Changed', 'Hi [[user_name]],', 'This email is to confirm that your account password has been successfully changed. If you did not request a password change, please contact us immediately.', 'authentication', 'customer', NULL, '{\"regards\":\"on\"}', '', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(15, 'Email Changed by User', 'users-change-email', 'Verify Your New Email Address - [[site_name]]', 'Hi [[user_name]],', '<strong>There was a request to change your email address.</strong> \n\nIf you really want to change your email, simply click the button below to confirm your new email address. \n\nIf you did not make this change, then you can just ignore this email; your email will not change.', 'authentication', 'customer', NULL, '{\"regards\":\"on\"}', '', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(16, 'Email Changed Successfully', 'users-change-email-success', 'Email Address Has Been Changed', 'Hi [[user_name]],', 'This email is to confirm that your account email address has been successfully changed. Now you can login at [[site_url]] with your new email address. If you did not make this change, please contact us immediately.', 'authentication', 'customer', NULL, '{\"regards\":\"on\"}', '', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(17, 'Unusual Login Email', 'users-unusual-login', 'Unusual Login Attempt on [[site_name]]', 'Hi [[user_name]],', 'We noticed you\'re having trouble logging into your account. There was few unsuccessful login attempt on your account. If this wasn\'t you, let us know.', 'authentication', 'customer', NULL, '{\"regards\":\"on\"}', '', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(18, 'Password Reset by Admin', 'users-admin-reset-password', 'Your Password is reseted on [[site_name]]', 'Hi [[user_name]],', 'We have reset your login password as per your requested via support. Now you can login at [[site_url]] with new password as below.', 'authentication', 'customer', NULL, '{\"regards\":\"on\"}', '', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(19, 'Welcome Email', 'user-registration-admin', 'Welcome to [[site_name]]', 'Hi [[user_name]],', 'You are receiving this email because you have registered on our site.', 'authentication', 'customer', NULL, '{\"regards\":\"on\"}', '', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(20, 'Deposit Order Placed', 'deposit-placed-customer', 'New Deposit #[[order_id]]', 'Hello [[user_name]],', 'Your deposit order has been placed and is now being waiting for payment. Your deposit details are shown below for your reference:\n[[order_details]]\n[[payment_information]]\n\nYour funds will add into your account as soon as we have confirmed the payment. \n\nFeel free to contact us if you have any questions.', 'deposits', 'customer', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[order_details]], [[payment_method]], [[payment_information]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(21, 'Deposit Order Placed', 'deposit-placed-admin', 'New Deposit #[[order_id]] by [[order_by]]', 'Hello Admin,', 'You have received an deposit order from [[order_by]]. The deposit order is as follows: \n[[order_details]] \n\nCustomer Details:\n[[user_detail]] \n\nThis is an automatic email confirmation, please check full order details in dashboard.\n\nThank You.', 'deposits', 'admin', NULL, '{\"regards\":\"off\"}', '[[user_detail]], [[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[order_details]], [[payment_method]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(22, 'Deposit Cancelled by User', 'deposit-cancel-user-customer', 'Deposit has been cancelled!', 'Dear [[user_name]],', 'Your recent deposit (#[[order_id]]) has been cancelled. \n\nIf you want to deposit funds into your again, please feel free to login into your account and add funds once again.\n\n\nIf you have any question, you can contact us at [[site_email]].', 'deposits', 'customer', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[order_details]], [[payment_method]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(23, 'Deposit Cancelled by User', 'deposit-cancel-user-admin', 'Deposit #[[order_id]] has been cancelled', 'Dear Admin,', 'The recent deposit order (#[[order_id]]) has been cancelled by [[order_by]]. \n\n\nThis is an automatic email confirmation, no need any action for further.\n\nPS. Do not reply to this email.\nThank you.', 'deposits', 'admin', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[order_details]], [[payment_method]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(24, 'Deposit Cancelled by Gateway', 'deposit-cancel-gateway-customer', 'Payment Rejected - Deposit #[[order_id]]', 'Dear [[user_name]],', 'The deposit (#[[order_id]]) has been canceled, however the payment was not successful and [[payment_method]] rejected or cancelled the payment.\n\n\nIf you have any question, you can contact us at [[site_email]].\n\nPS. Do not reply to this email.\nThank you.', 'deposits', 'customer', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[order_details]], [[payment_method]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(25, 'Deposit Cancelled by Gateway', 'deposit-cancel-gateway-admin', 'Deposit #[[order_id]] has been cancelled', 'Dear Admin,', 'The recent deposit order (#[[order_id]]) has been cancelled by [[payment_method]], however the payment was not made. \n\n\nThis is an automatic email confirmation, no need any action for further.\n\nPS. Do not reply to this email.\nThank you.', 'deposits', 'admin', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[order_details]], [[payment_method]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(26, 'Deposit Rejected by Admin', 'deposit-reject-customer', 'Cancelled Deposit #[[order_id]]', 'Dear [[user_name]],', 'The deposit (#[[order_id]]) has been cancelled, however we have not received your payment of [[order_amount]] (via [[payment_method]]).\n\n\nIf you have any question, you can contact us at [[site_email]].\n\nPS. Do not reply to this email.\nThank you.', 'deposits', 'customer', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]] , [[order_time]], [[order_details]], [[payment_method]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(27, 'Deposit Rejected by Admin', 'deposit-reject-admin', 'Deposit #[[order_id]] has been cancelled', 'Dear Admin,', 'The deposit order (#[[order_id]]) has been cancelled. \n\nPS. Do not reply to this email.\nThank you.', 'deposits', 'admin', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[order_details]], [[payment_method]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(28, 'Deposit Order Approved', 'deposit-approved-customer', 'Deposit successfully processed!', 'Dear [[user_name]],', 'Your deposit of [[order_amount]] has been successfully approved. \nThis email confirms that funds have been added to your account.\n\nIf you have any question, you can contact us at [[site_email]].', 'deposits', 'customer', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[order_details]], [[payment_method]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(29, 'Deposit Order Approved', 'deposit-approved-admin', 'Deposit Successfull - Order #[[order_id]]', 'Dear Admin,', 'The deposit order (#[[order_id]]) has been approved and funds of [[order_amount]] added into user account. \n\nPS. Do not reply to this email.\nThank you.', 'deposits', 'admin', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[order_details]], [[payment_method]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(30, 'Deposit Success by Gateway', 'deposit-success-gateway-customer', 'Deposit successfully processed!', 'Dear [[user_name]],', 'Your deposit of [[order_amount]] has been successfully. \nThis email confirms that funds have been added to your account.\n\nIf you have any question, you can contact us at [[site_email]].', 'deposits', 'customer', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[order_details]], [[payment_method]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(31, 'Deposit Success by Gateway', 'deposit-success-gateway-admin', 'Deposit Successfull - Order #[[order_id]]', 'Dear Admin,', 'You just received a payment of [[order_amount]] for deposit order (#[[order_id]]) via [[payment_method]]. \n\nPS. Do not reply to this email.\nThank you.', 'deposits', 'admin', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[order_details]], [[payment_method]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(32, 'Deposit Refund by Admin', 'deposit-refund-customer', 'Your deposit (#[[order_id]]) has been refunded!', 'Hello [[user_name]],', 'We have refunded your funds and re-adjusted your account balance. Please find below your refund and original deposit details. \n\nPS. Do not reply to this email.\nThank you.', 'deposits', 'customer', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[order_details]], [[payment_method]], [[refund_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(33, 'Deposit Refund by Admin', 'deposit-refund-admin', 'Refunded Deposit #[[order_id]]', 'Hello Admin,', 'The deposit order (#[[order_id]]) refunded successfully. The user account balance adjusted with refund amount of [[order_amount]]. \n\nPS. Do not reply to this email.\nThank you.', 'deposits', 'admin', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[order_details]], [[payment_method]], [[refund_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(34, 'Withdraw Request', 'withdraw-request-customer', 'Your Withdraw Request Has Been Received', 'Hello [[user_name]],', 'We received your request to withdraw funds from [[site_name]]. The funds will be deposited in your provided account and should be processed with 24-72 hours. You will be notified by email when we have completed your withdraw.\n\nWithdrawal Details:\n[[withdraw_details]]\n\nNote: If you did not make this withdraw request, please contact us immediately before its authorized by our team.\n\nIf you have any questions, please feel free to contact us.\n', 'withdrawal', 'customer', NULL, '{\"regards\":\"on\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[payment_method]], [[withdraw_to]], [[withdraw_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(35, 'Withdraw Request', 'withdraw-request-admin', 'Withdraw Request from [[user_name]]', 'Hello Admin,', 'A user ([[user_name]] - [[user_email]]) requested to withdraw funds. Please review the withdraw request as soon as possible.\n[[withdraw_details]]\n\nPlease login into account and take necessary steps for withdraw.\n\n\nPS. Do not reply to this email.\nThank you.\n', 'withdrawal', 'admin', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[payment_method]], [[withdraw_to]], [[withdraw_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(36, 'Withdraw Cancel Request', 'withdraw-cancel-user-customer', 'Withdraw Has Been Cancelled!', 'Hello [[user_name]],', 'Your recent withdraw request (#[[order_id]]) has been cancelled. The funds returned to your account balance.\n\nIf you want to withdraw funds into your account again, please feel free to login into your account and withdraw once again.\n\nIf you have any questions, please feel free to contact us.\n', 'withdrawal', 'customer', NULL, '{\"regards\":\"on\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[payment_method]], [[withdraw_to]], [[withdraw_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(37, 'Withdraw Cancel Request', 'withdraw-cancel-user-admin', 'Cancelled Withdraw Request by [[user_name]]', 'Hello Admin,', 'The recent withdraw request (#[[order_id]]) has been cancelled by user ([[user_name]] - [[user_email]]). \nYou do not need to take any further action.\n\n\nPS. Do not reply to this email.\nThank you.\n', 'withdrawal', 'admin', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[payment_method]], [[withdraw_to]], [[withdraw_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(38, 'Withdraw Order Confirmed', 'withdraw-confirmed-customer', 'Withdrawal Successfully Confirmed!', 'Dear [[user_name]],', 'Your withdraw request of [[order_amount]] has been successfully confirmed. \nThis email confirms that your desired amount will deposited in your account ([[withdraw_to]]) within few hours.\n\nIf you have any question, you can contact us at [[site_email]].', 'withdrawal', 'customer', NULL, '{\"regards\":\"on\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[payment_method]], [[withdraw_to]], [[withdraw_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(39, 'Withdraw Order Confirmed', 'withdraw-confirmed-admin', 'Withdraw Request #[[order_id]] Has Been Confirmed', 'Hello Admin,', 'The withdraw request (#[[order_id]]) has been confirmed and notified to user ([[user_name]] - [[user_email]]). Withdraw amount of [[order_amount]] need to be processed for this user.\n\nPS. Do not reply to this email.\nThank you.', 'withdrawal', 'admin', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[payment_method]], [[withdraw_to]], [[withdraw_details]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(40, 'Withdraw Processed Request', 'withdraw-success-customer', 'Your Withdraw Request Has Been Completed', 'Hello [[user_name]],', '<strong>Congratulations!</strong>\n\nYour withdraw request (#[[order_id]]) has been successfully processed and a total amount of <strong>[[order_amount]]</strong> has been withdrawn from your account. Your funds transferred into your account as below. \n\nPayment Deposited: \n<strong>[[withdraw_to]]</strong> ([[payment_method]]).\n\nWithdraw Reference: \n[[withdraw_reference]]\n[[withdraw_note]]\n\nIf you have not received funds into your account yet, please feel free to contact us.\n', 'withdrawal', 'customer', NULL, '{\"regards\":\"on\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[payment_method]], [[withdraw_to]], [[withdraw_details]], [[withdraw_reference]], [[withdraw_note]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(41, 'Withdraw Processed Request', 'withdraw-success-admin', 'Withdraw Request #[[order_id]] Has Been Processed', 'Hello Admin,', 'The withdraw request (#[[order_id]]) has been processed and notified to user ([[user_name]] - [[user_email]]). \n\nWithdraw Details:\n[[withdraw_details]] \n\nWithdraw Reference:\n[[withdraw_reference]] \n[[withdraw_note]]\n\nPS. Do not reply to this email.\nThank you.', 'withdrawal', 'admin', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[payment_method]], [[withdraw_to]], [[withdraw_details]], [[withdraw_reference]], [[withdraw_note]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(42, 'Withdraw Rejected by Admin', 'withdraw-reject-customer', 'Withdraw Request Has Been Rejected', 'Hello [[user_name]],', 'We have received your request (#[[order_id]]) to withdraw funds. We would like to inform you that we have cancelled this request and the funds ([[order_all_amount]]) returned to your account balance.\n\nWithdraw request has been rejected for following reason -\n[[withdraw_note]]\n\nIf you have any questions, please feel free to contact us.', 'withdrawal', 'customer', NULL, '{\"regards\":\"on\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[payment_method]], [[withdraw_to]], [[withdraw_details]], [[withdraw_note]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(43, 'Withdraw Rejected by Admin', 'withdraw-reject-admin', 'Withdraw Request Has Been Rejected', 'Hello [[user_name]],', 'The withdraw request (#[[order_id]]) has been rejected. The amount of [[order_all_amount]] has been adjusted to user account balance and notified to user ([[user_name]] - [[user_email]]). \n\nRejection Note: \n[[withdraw_note]]\n\nPS. Do not reply to this email.\nThank you.', 'withdrawal', 'admin', NULL, '{\"regards\":\"off\"}', '[[order_id]], [[order_by]], [[order_amount]], [[order_all_amount]], [[order_time]], [[payment_method]], [[withdraw_to]], [[withdraw_details]], [[withdraw_note]]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iv_actions`
--

CREATE TABLE `iv_actions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(191) NOT NULL,
  `action_by` bigint(20) NOT NULL,
  `action_at` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `type_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iv_actions`
--

INSERT INTO `iv_actions` (`id`, `action`, `action_by`, `action_at`, `type`, `type_id`) VALUES
(1, 'order', 2, '2022-04-14 22:52:10', 'invest', 1),
(2, 'active', 1, '2022-04-14 22:54:47', 'invest', 1),
(3, 'complete', 1, '2022-06-09 03:33:11', 'invest', 1),
(4, 'order', 7, '2022-06-09 13:28:57', 'invest', 2),
(5, 'active', 1, '2022-06-09 20:54:29', 'invest', 2),
(6, 'order', 30, '2022-06-13 08:57:20', 'invest', 3),
(7, 'order', 2, '2022-06-27 19:21:50', 'invest', 4),
(8, 'active', 1, '2022-06-27 19:23:43', 'invest', 4),
(9, 'active', 1, '2022-06-28 18:45:54', 'invest', 1),
(10, 'active', 1, '2022-06-28 20:14:17', 'invest', 4),
(11, 'order', 37, '2022-06-30 01:35:12', 'invest', 5),
(12, 'active', 1, '2022-07-08 23:08:21', 'invest', 5),
(13, 'order', 40, '2022-07-08 23:14:22', 'invest', 6),
(14, 'active', 1, '2022-07-08 23:16:10', 'invest', 6),
(15, 'active', 1, '2022-07-10 09:09:45', 'invest', 6),
(16, 'order', 37, '2022-07-22 09:38:40', 'invest', 7),
(17, 'active', 1, '2022-07-28 15:04:10', 'invest', 7),
(18, 'complete', 1, '2022-08-15 02:43:58', 'invest', 5),
(19, 'order', 50, '2022-08-23 21:23:50', 'invest', 8),
(20, 'active', 1, '2022-08-24 22:41:57', 'invest', 8),
(21, 'complete', 1, '2022-08-29 06:03:27', 'invest', 6),
(22, 'complete', 1, '2022-09-08 00:22:46', 'invest', 8),
(23, 'order', 2, '2022-09-16 11:22:50', 'invest', 9),
(24, 'order', 2, '2022-09-19 15:25:19', 'invest', 10),
(25, 'active', 1, '2022-09-19 18:29:17', 'invest', 10),
(26, 'order', 76, '2022-09-24 10:05:59', 'invest', 11),
(27, 'active', 1, '2022-09-24 10:08:36', 'invest', 11),
(28, 'order', 76, '2022-09-24 10:10:55', 'invest', 12),
(29, 'active', 1, '2022-09-24 10:11:57', 'invest', 12);

-- --------------------------------------------------------

--
-- Table structure for table `iv_invests`
--

CREATE TABLE `iv_invests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ivx` varchar(191) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `amount` double NOT NULL,
  `profit` double NOT NULL,
  `total` double NOT NULL,
  `received` double NOT NULL,
  `currency` varchar(191) NOT NULL,
  `rate` varchar(191) NOT NULL,
  `term` varchar(191) NOT NULL,
  `term_count` int(11) NOT NULL,
  `term_total` int(11) NOT NULL,
  `term_calc` varchar(191) NOT NULL,
  `term_start` datetime DEFAULT NULL,
  `term_end` datetime DEFAULT NULL,
  `reference` bigint(20) NOT NULL,
  `scheme` text NOT NULL,
  `scheme_id` bigint(20) UNSIGNED DEFAULT NULL,
  `meta` text DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iv_ledgers`
--

CREATE TABLE `iv_ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ivx` varchar(191) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type` varchar(191) NOT NULL,
  `calc` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `fees` double NOT NULL,
  `total` double NOT NULL,
  `currency` varchar(191) NOT NULL,
  `desc` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `invest_id` bigint(20) NOT NULL,
  `tnx_id` bigint(20) NOT NULL,
  `reference` bigint(20) NOT NULL,
  `meta` text DEFAULT NULL,
  `source` varchar(191) DEFAULT NULL,
  `dest` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iv_ledgers`
--

INSERT INTO `iv_ledgers` (`id`, `ivx`, `user_id`, `type`, `calc`, `amount`, `fees`, `total`, `currency`, `desc`, `remarks`, `note`, `invest_id`, `tnx_id`, `reference`, `meta`, `source`, `dest`, `created_at`, `updated_at`) VALUES
(1, '74870001', 2, 'invest', 'none', 100, 0, 100, 'USD', 'Invest on Mercury', NULL, NULL, 1, 5, 28300001, NULL, 'main_wallet', 'invest_wallet', '2022-04-14 21:54:47', '2022-04-14 21:54:47'),
(2, '21900002', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:10', '2022-06-09 02:33:10'),
(3, '19900003', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:10', '2022-06-09 02:33:10'),
(4, '58910004', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(5, '48910005', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(6, '14910006', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(7, '84910007', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(8, '10910008', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(9, '75910009', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(10, '77910010', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(11, '76910011', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(12, '24910012', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(13, '34910013', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(14, '80910014', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(15, '95910015', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(16, '68910016', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(17, '68910017', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(18, '84910018', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(19, '21910019', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(20, '99910020', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(21, '69910021', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(22, '52910022', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(23, '47910023', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(24, '11910024', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(25, '45910025', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(26, '91910026', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(27, '90910027', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(28, '33910028', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(29, '29910029', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(30, '52910030', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(31, '88910031', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(32, '21910032', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(33, '15910033', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(34, '44910034', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(35, '11910035', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(36, '31910036', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(37, '31910037', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(38, '11910038', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(39, '80910039', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(40, '52910040', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(41, '74910041', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(42, '94910042', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(43, '93910043', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(44, '66910044', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(45, '85910045', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(46, '34910046', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(47, '49910047', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(48, '94910048', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(49, '88910049', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(50, '71910050', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(51, '90910051', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(52, '19910052', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(53, '74910053', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(54, '43910054', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(55, '49910055', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(56, '90910056', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(57, '83910057', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(58, '29910058', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(59, '67910059', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(60, '95910060', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(61, '75910061', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(62, '63910062', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(63, '78910063', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(64, '51910064', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(65, '43910065', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(66, '34910066', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(67, '64910067', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(68, '95910068', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(69, '90910069', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(70, '94910070', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(71, '31910071', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(72, '36910072', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(73, '64910073', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(74, '97910074', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(75, '55910075', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(76, '13910076', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(77, '32910077', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(78, '76910078', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(79, '87910079', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(80, '27910080', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(81, '53910081', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(82, '80910082', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(83, '40910083', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(84, '99910084', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(85, '70910085', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(86, '70910086', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(87, '63910087', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(88, '64910088', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(89, '62910089', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(90, '74910090', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(91, '16910091', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(92, '66910092', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(93, '82910093', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(94, '73910094', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(95, '39910095', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(96, '60910096', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(97, '43910097', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(98, '18910098', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(99, '12910099', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(100, '74910100', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(101, '61910101', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(102, '70910102', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(103, '35910103', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(104, '29910104', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(105, '42910105', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(106, '38910106', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(107, '51910107', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(108, '25910108', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(109, '98910109', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(110, '55910110', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(111, '89910111', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(112, '97910112', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(113, '72910113', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(114, '46910114', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(115, '46910115', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(116, '71910116', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(117, '17910117', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(118, '78910118', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(119, '78910119', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(120, '34910120', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(121, '63910121', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(122, '44910122', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(123, '40910123', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(124, '69910124', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(125, '76910125', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(126, '10910126', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(127, '74910127', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(128, '66910128', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(129, '87910129', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(130, '21910130', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(131, '71910131', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(132, '75910132', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(133, '85910133', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(134, '56910134', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(135, '57910135', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(136, '68910136', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(137, '84910137', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(138, '69910138', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(139, '33910139', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(140, '59910140', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(141, '83910141', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(142, '10910142', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(143, '94910143', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(144, '87910144', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(145, '92910145', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(146, '35910146', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(147, '57910147', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(148, '37910148', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(149, '66910149', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(150, '31910150', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(151, '86910151', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(152, '64910152', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(153, '35910153', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(154, '65910154', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(155, '93910155', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(156, '48910156', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(157, '34910157', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(158, '28910158', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(159, '25910159', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(160, '62910160', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(161, '20910161', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(162, '17910162', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(163, '89910163', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(164, '73910164', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(165, '34910165', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(166, '27910166', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(167, '31910167', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(168, '32910168', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(169, '90910169', 2, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 1, 0, 1654745590, NULL, 'invest_wallet', NULL, '2022-06-09 02:33:11', '2022-06-09 02:33:11'),
(170, '66690170', 7, 'invest', 'none', 100, 0, 100, 'USD', 'Invest on Premium Plan', NULL, NULL, 2, 12, 21360002, NULL, 'main_wallet', 'invest_wallet', '2022-06-09 19:54:29', '2022-06-09 19:54:29'),
(171, '48230171', 2, 'invest', 'none', 100, 0, 100, 'USD', 'Invest on Mercury', NULL, NULL, 4, 13, 93100004, NULL, 'main_wallet', 'invest_wallet', '2022-06-27 18:23:43', '2022-06-27 18:23:43'),
(172, '48540172', 2, 'invest', 'none', 100, 0, 100, 'USD', 'Invest on Mercury', NULL, NULL, 1, 14, 28300001, NULL, 'main_wallet', 'invest_wallet', '2022-06-28 17:45:54', '2022-06-28 17:45:54'),
(173, '74570173', 2, 'invest', 'none', 100, 0, 100, 'USD', 'Invest on Mercury', NULL, NULL, 4, 15, 93100004, NULL, 'main_wallet', 'invest_wallet', '2022-06-28 19:14:17', '2022-06-28 19:14:17'),
(174, '25010174', 37, 'invest', 'none', 100, 0, 100, 'USD', 'Invest on Mercury', NULL, NULL, 5, 21, 82120005, NULL, 'main_wallet', 'invest_wallet', '2022-07-08 22:08:21', '2022-07-08 22:08:21'),
(175, '85700175', 40, 'invest', 'none', 250, 0, 250, 'USD', 'Invest on Venus', NULL, NULL, 6, 22, 84620006, NULL, 'main_wallet', 'invest_wallet', '2022-07-08 22:16:10', '2022-07-08 22:16:10'),
(176, '91850176', 40, 'invest', 'none', 250, 0, 250, 'USD', 'Invest on Venus', NULL, NULL, 6, 24, 84620006, NULL, 'main_wallet', 'invest_wallet', '2022-07-10 08:09:45', '2022-07-10 08:09:45'),
(177, '76500177', 37, 'invest', 'none', 100, 0, 100, 'USD', 'Invest on Premium Plan', NULL, NULL, 7, 25, 48200007, NULL, 'main_wallet', 'invest_wallet', '2022-07-28 14:04:10', '2022-07-28 14:04:10'),
(178, '37340178', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(179, '96340179', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(180, '18340180', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(181, '98340181', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(182, '33340182', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(183, '34340183', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(184, '72340184', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(185, '28340185', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(186, '76340186', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(187, '68340187', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(188, '31340188', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(189, '40340189', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(190, '79340190', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(191, '64340191', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(192, '34340192', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(193, '94340193', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(194, '72340194', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(195, '35340195', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(196, '85340196', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(197, '97340197', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(198, '37340198', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(199, '64340199', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(200, '46340200', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(201, '55340201', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(202, '88340202', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(203, '22340203', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(204, '67340204', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(205, '39340205', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(206, '62340206', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(207, '73340207', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(208, '30340208', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(209, '99340209', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(210, '37340210', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(211, '74340211', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(212, '35340212', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(213, '43340213', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(214, '21340214', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(215, '83340215', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(216, '29340216', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(217, '71340217', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(218, '50340218', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(219, '30340219', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(220, '95340220', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(221, '49340221', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(222, '24340222', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:54', '2022-08-15 01:43:54'),
(223, '43350223', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(224, '26350224', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(225, '97350225', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(226, '10350226', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(227, '64350227', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(228, '86350228', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(229, '42350229', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(230, '17350230', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(231, '43350231', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(232, '26350232', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(233, '18350233', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(234, '80350234', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(235, '23350235', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(236, '82350236', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(237, '36350237', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(238, '87350238', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(239, '39350239', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(240, '66350240', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(241, '34350241', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(242, '90350242', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(243, '98350243', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(244, '34350244', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(245, '46350245', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(246, '71350246', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(247, '22350247', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(248, '18350248', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(249, '80350249', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(250, '95350250', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(251, '48350251', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(252, '66350252', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(253, '67350253', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(254, '78350254', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(255, '83350255', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(256, '70350256', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(257, '80350257', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(258, '82350258', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(259, '54350259', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(260, '85350260', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(261, '57350261', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(262, '43350262', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(263, '66350263', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(264, '25350264', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(265, '66350265', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(266, '67350266', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(267, '42350267', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(268, '26350268', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(269, '43350269', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(270, '83350270', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55');
INSERT INTO `iv_ledgers` (`id`, `ivx`, `user_id`, `type`, `calc`, `amount`, `fees`, `total`, `currency`, `desc`, `remarks`, `note`, `invest_id`, `tnx_id`, `reference`, `meta`, `source`, `dest`, `created_at`, `updated_at`) VALUES
(271, '97350271', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(272, '40350272', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(273, '34350273', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(274, '10350274', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(275, '18350275', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(276, '42350276', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(277, '40350277', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(278, '36350278', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(279, '22350279', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(280, '97350280', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(281, '69350281', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(282, '17350282', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(283, '35350283', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(284, '67350284', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(285, '21350285', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(286, '89350286', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(287, '95350287', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(288, '27350288', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(289, '89350289', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(290, '90350290', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(291, '15350291', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(292, '43350292', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(293, '62350293', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(294, '15350294', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(295, '38350295', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(296, '19350296', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(297, '81350297', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(298, '55350298', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(299, '68350299', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(300, '63350300', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(301, '98350301', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(302, '25350302', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(303, '90350303', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(304, '31350304', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(305, '71350305', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(306, '10350306', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(307, '63350307', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(308, '81350308', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:55', '2022-08-15 01:43:55'),
(309, '74380309', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(310, '59380310', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(311, '46380311', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(312, '60380312', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(313, '14380313', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(314, '71380314', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(315, '83380315', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(316, '85380316', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(317, '45380317', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(318, '53380318', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(319, '79380319', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(320, '78380320', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(321, '73380321', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(322, '80380322', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(323, '89380323', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(324, '66380324', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(325, '20380325', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(326, '16380326', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(327, '32380327', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(328, '89380328', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(329, '57380329', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(330, '45380330', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(331, '81380331', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(332, '13380332', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(333, '68380333', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(334, '23380334', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(335, '25380335', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(336, '69380336', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(337, '79380337', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(338, '73380338', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(339, '64380339', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(340, '66380340', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(341, '29380341', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(342, '78380342', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(343, '89380343', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(344, '30380344', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(345, '78380345', 37, 'profit', 'credit', 0.85, 0, 0.85, 'USD', 'Profit Earned', NULL, NULL, 5, 0, 1660531434, NULL, 'invest_wallet', NULL, '2022-08-15 01:43:58', '2022-08-15 01:43:58'),
(346, '88820346', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(347, '46830347', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(348, '35830348', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(349, '84830349', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(350, '99830350', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(351, '77830351', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(352, '75830352', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(353, '37830353', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(354, '50830354', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(355, '68830355', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(356, '44830356', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(357, '11830357', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(358, '13830358', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(359, '49830359', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(360, '67830360', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(361, '96830361', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(362, '59830362', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(363, '64830363', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(364, '42830364', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(365, '14830365', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1660534982, NULL, 'invest_wallet', NULL, '2022-08-15 02:43:03', '2022-08-15 02:43:03'),
(366, '90640366', 37, 'transfer', 'debit', 18109.6, 0, 18109.6, 'USD', 'Transferred to Main Account', NULL, NULL, 0, 26, 89660164, '{\"mode\":\"manual\"}', 'invest_wallet', 'main_wallet', '2022-08-15 12:29:24', '2022-08-15 12:29:24'),
(367, '24170367', 50, 'invest', 'none', 5000, 0, 5000, 'USD', 'Invest on Professional Plan', NULL, NULL, 8, 30, 94290008, NULL, 'main_wallet', 'invest_wallet', '2022-08-24 21:41:57', '2022-08-24 21:41:57'),
(368, '23790368', 50, 'profit', 'credit', 12141.15, 0, 12141.15, 'USD', 'Profit Earned', NULL, NULL, 8, 0, 1661752779, NULL, 'invest_wallet', NULL, '2022-08-29 04:59:39', '2022-08-29 04:59:39'),
(369, '56790369', 50, 'profit', 'credit', 12141.15, 0, 12141.15, 'USD', 'Profit Earned', NULL, NULL, 8, 0, 1661752779, NULL, 'invest_wallet', NULL, '2022-08-29 04:59:39', '2022-08-29 04:59:39'),
(370, '37790370', 50, 'profit', 'credit', 12141.15, 0, 12141.15, 'USD', 'Profit Earned', NULL, NULL, 8, 0, 1661752779, NULL, 'invest_wallet', NULL, '2022-08-29 04:59:39', '2022-08-29 04:59:39'),
(371, '77790371', 50, 'profit', 'credit', 12141.15, 0, 12141.15, 'USD', 'Profit Earned', NULL, NULL, 8, 0, 1661752779, NULL, 'invest_wallet', NULL, '2022-08-29 04:59:39', '2022-08-29 04:59:39'),
(372, '30060372', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(373, '69060373', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(374, '23060374', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(375, '28060375', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(376, '44060376', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(377, '49060377', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(378, '54060378', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(379, '60060379', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(380, '29060380', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(381, '66060381', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(382, '93060382', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(383, '13060383', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(384, '45060384', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(385, '20060385', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(386, '13060386', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(387, '39060387', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(388, '80060388', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(389, '96060389', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(390, '45060390', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:26', '2022-08-29 05:03:26'),
(391, '49070391', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:27', '2022-08-29 05:03:27'),
(392, '57070392', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:27', '2022-08-29 05:03:27'),
(393, '76070393', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:27', '2022-08-29 05:03:27'),
(394, '39070394', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:27', '2022-08-29 05:03:27'),
(395, '39070395', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:27', '2022-08-29 05:03:27'),
(396, '78070396', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:27', '2022-08-29 05:03:27'),
(397, '17070397', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:27', '2022-08-29 05:03:27'),
(398, '39070398', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:27', '2022-08-29 05:03:27'),
(399, '20070399', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:27', '2022-08-29 05:03:27'),
(400, '15070400', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:27', '2022-08-29 05:03:27'),
(401, '66070401', 40, 'profit', 'credit', 1883.34, 0, 1883.34, 'USD', 'Profit Earned', NULL, NULL, 6, 0, 1661753006, NULL, 'invest_wallet', NULL, '2022-08-29 05:03:27', '2022-08-29 05:03:27'),
(402, '17170402', 50, 'profit', 'credit', 12141.15, 0, 12141.15, 'USD', 'Profit Earned', NULL, NULL, 8, 0, 1662384417, NULL, 'invest_wallet', NULL, '2022-09-05 12:26:58', '2022-09-05 12:26:58'),
(403, '35180403', 50, 'profit', 'credit', 12141.15, 0, 12141.15, 'USD', 'Profit Earned', NULL, NULL, 8, 0, 1662384417, NULL, 'invest_wallet', NULL, '2022-09-05 12:26:58', '2022-09-05 12:26:58'),
(404, '61180404', 50, 'profit', 'credit', 12141.15, 0, 12141.15, 'USD', 'Profit Earned', NULL, NULL, 8, 0, 1662384417, NULL, 'invest_wallet', NULL, '2022-09-05 12:26:58', '2022-09-05 12:26:58'),
(405, '53180405', 50, 'profit', 'credit', 12141.15, 0, 12141.15, 'USD', 'Profit Earned', NULL, NULL, 8, 0, 1662384417, NULL, 'invest_wallet', NULL, '2022-09-05 12:26:58', '2022-09-05 12:26:58'),
(406, '71180406', 50, 'profit', 'credit', 12141.15, 0, 12141.15, 'USD', 'Profit Earned', NULL, NULL, 8, 0, 1662384417, NULL, 'invest_wallet', NULL, '2022-09-05 12:26:58', '2022-09-05 12:26:58'),
(407, '72180407', 50, 'profit', 'credit', 12141.15, 0, 12141.15, 'USD', 'Profit Earned', NULL, NULL, 8, 0, 1662384417, NULL, 'invest_wallet', NULL, '2022-09-05 12:26:58', '2022-09-05 12:26:58'),
(408, '75180408', 50, 'profit', 'credit', 12141.15, 0, 12141.15, 'USD', 'Profit Earned', NULL, NULL, 8, 0, 1662384417, NULL, 'invest_wallet', NULL, '2022-09-05 12:26:58', '2022-09-05 12:26:58'),
(409, '82720409', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1662596072, NULL, 'invest_wallet', NULL, '2022-09-07 23:14:32', '2022-09-07 23:14:32'),
(410, '21720410', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1662596072, NULL, 'invest_wallet', NULL, '2022-09-07 23:14:32', '2022-09-07 23:14:32'),
(411, '78720411', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1662596072, NULL, 'invest_wallet', NULL, '2022-09-07 23:14:32', '2022-09-07 23:14:32'),
(412, '83720412', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1662596072, NULL, 'invest_wallet', NULL, '2022-09-07 23:14:32', '2022-09-07 23:14:32'),
(413, '17720413', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1662596072, NULL, 'invest_wallet', NULL, '2022-09-07 23:14:32', '2022-09-07 23:14:32'),
(414, '79720414', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1662596072, NULL, 'invest_wallet', NULL, '2022-09-07 23:14:32', '2022-09-07 23:14:32'),
(415, '66720415', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1662596072, NULL, 'invest_wallet', NULL, '2022-09-07 23:14:32', '2022-09-07 23:14:32'),
(416, '48720416', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1662596072, NULL, 'invest_wallet', NULL, '2022-09-07 23:14:32', '2022-09-07 23:14:32'),
(417, '76720417', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1662596072, NULL, 'invest_wallet', NULL, '2022-09-07 23:14:32', '2022-09-07 23:14:32'),
(418, '74720418', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1662596072, NULL, 'invest_wallet', NULL, '2022-09-07 23:14:32', '2022-09-07 23:14:32'),
(419, '16720419', 37, 'profit', 'credit', 898.34, 0, 898.34, 'USD', 'Profit Earned', NULL, NULL, 7, 0, 1662596072, NULL, 'invest_wallet', NULL, '2022-09-07 23:14:32', '2022-09-07 23:14:32'),
(420, '66660420', 50, 'profit', 'credit', 12141.15, 0, 12141.15, 'USD', 'Profit Earned', NULL, NULL, 8, 0, 1662596566, NULL, 'invest_wallet', NULL, '2022-09-07 23:22:46', '2022-09-07 23:22:46'),
(421, '56660421', 50, 'profit', 'credit', 12141.15, 0, 12141.15, 'USD', 'Profit Earned', NULL, NULL, 8, 0, 1662596566, NULL, 'invest_wallet', NULL, '2022-09-07 23:22:46', '2022-09-07 23:22:46'),
(422, '65660422', 50, 'profit', 'credit', 12141.15, 0, 12141.15, 'USD', 'Profit Earned', NULL, NULL, 8, 0, 1662596566, NULL, 'invest_wallet', NULL, '2022-09-07 23:22:46', '2022-09-07 23:22:46'),
(423, '77250423', 37, 'transfer', 'debit', 9881.74, 0, 9881.74, 'USD', 'Transferred to Main Account', NULL, NULL, 0, 31, 68867925, '{\"mode\":\"manual\"}', 'invest_wallet', 'main_wallet', '2022-09-08 02:32:05', '2022-09-08 02:32:05'),
(424, '98710424', 50, 'transfer', 'debit', 169976.1, 0, 169976.1, 'USD', 'Transferred to Main Account', NULL, NULL, 0, 32, 52877871, '{\"mode\":\"manual\"}', 'invest_wallet', 'main_wallet', '2022-09-12 14:51:11', '2022-09-12 14:51:11'),
(425, '71570425', 2, 'invest', 'none', 100, 0, 100, 'USD', 'Invest on Bronze', NULL, NULL, 10, 34, 70190001, NULL, 'main_wallet', 'invest_wallet', '2022-09-19 18:29:17', '2022-09-19 18:29:17'),
(426, '38160426', 76, 'invest', 'none', 5100, 0, 5100, 'USD', 'Invest on Gold', NULL, NULL, 11, 52, 94590011, NULL, 'main_wallet', 'invest_wallet', '2022-09-24 10:08:36', '2022-09-24 10:08:36'),
(427, '19170427', 76, 'invest', 'none', 100, 0, 100, 'USD', 'Invest on Bronze', NULL, NULL, 12, 53, 87550012, NULL, 'main_wallet', 'invest_wallet', '2022-09-24 10:11:57', '2022-09-24 10:11:57');

-- --------------------------------------------------------

--
-- Table structure for table `iv_profits`
--

CREATE TABLE `iv_profits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `invest_id` bigint(20) NOT NULL,
  `amount` double NOT NULL,
  `capital` double NOT NULL,
  `invested` double NOT NULL,
  `currency` varchar(191) NOT NULL,
  `rate` double NOT NULL,
  `type` varchar(191) NOT NULL,
  `term_no` int(11) NOT NULL,
  `payout` bigint(20) DEFAULT NULL,
  `calc_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iv_schemes`
--

CREATE TABLE `iv_schemes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `short` varchar(191) DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `amount` double NOT NULL,
  `maximum` double DEFAULT NULL,
  `is_fixed` tinyint(1) NOT NULL DEFAULT 0,
  `term` int(11) NOT NULL,
  `term_type` varchar(191) NOT NULL,
  `rate` double(8,2) NOT NULL,
  `rate_type` varchar(191) NOT NULL,
  `calc_period` varchar(191) NOT NULL,
  `days_only` tinyint(1) NOT NULL,
  `capital` tinyint(1) NOT NULL,
  `payout` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `is_locked` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iv_schemes`
--

INSERT INTO `iv_schemes` (`id`, `name`, `slug`, `short`, `desc`, `amount`, `maximum`, `is_fixed`, `term`, `term_type`, `rate`, `rate_type`, `calc_period`, `days_only`, `capital`, `payout`, `status`, `is_locked`, `featured`, `deleted_at`, `created_at`, `updated_at`) VALUES
(16, 'Bronze', 'bronze', 'BR', '', 100, 1000, 0, 3, 'months', 1.00, 'percent', 'daily', 0, 1, 'term_basis', 'active', 1, 0, NULL, '2022-09-16 20:41:16', '2022-09-19 18:29:17'),
(17, 'Sliver', 'sliver', 'SL', '', 1100, 5000, 0, 3, 'months', 1.50, 'percent', 'daily', 0, 1, 'term_basis', 'active', NULL, 0, NULL, '2022-09-16 20:34:56', '2022-09-16 20:37:50'),
(18, 'Gold', 'gold', 'GL', '', 5100, 20000, 0, 3, 'months', 2.00, 'percent', 'daily', 0, 1, 'term_basis', 'active', 1, 0, NULL, '2022-09-16 20:42:19', '2022-09-24 10:08:36'),
(19, 'Diamond', 'diamond', 'DI', '', 21000, 2000000, 0, 3, 'months', 2.20, 'percent', 'daily', 0, 1, 'term_basis', 'active', NULL, 0, NULL, '2022-09-16 20:43:57', '2022-09-19 20:32:47');

-- --------------------------------------------------------

--
-- Table structure for table `iv_scheme_metas`
--

CREATE TABLE `iv_scheme_metas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `scheme_id` bigint(20) NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iv_scheme_metas`
--

INSERT INTO `iv_scheme_metas` (`id`, `scheme_id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 2, 'plan_limit', '0', '2022-06-07 13:06:29', '2022-06-07 13:06:29'),
(2, 2, 'plan_limit_user', '0', '2022-06-07 13:06:29', '2022-06-07 13:06:29'),
(3, 3, 'plan_limit', '0', '2022-06-09 20:22:26', '2022-06-09 20:22:26'),
(4, 3, 'plan_limit_user', '0', '2022-06-09 20:22:26', '2022-06-09 20:22:26'),
(5, 5, 'plan_limit', '0', '2022-06-09 21:25:16', '2022-06-09 21:25:16'),
(6, 5, 'plan_limit_user', '0', '2022-06-09 21:25:16', '2022-06-09 21:25:16'),
(7, 6, 'plan_limit', '0', '2022-06-09 21:37:02', '2022-06-09 21:37:02'),
(8, 6, 'plan_limit_user', '0', '2022-06-09 21:37:02', '2022-06-09 21:37:02'),
(9, 16, 'plan_limit', '0', '2022-09-16 11:11:02', '2022-09-16 11:11:02'),
(10, 16, 'plan_limit_user', '0', '2022-09-16 11:11:02', '2022-09-16 11:11:02'),
(11, 17, 'plan_limit', '0', '2022-09-16 20:34:56', '2022-09-16 20:34:56'),
(12, 17, 'plan_limit_user', '0', '2022-09-16 20:34:56', '2022-09-16 20:34:56'),
(13, 18, 'plan_limit', '0', '2022-09-16 20:41:16', '2022-09-16 20:41:16'),
(14, 18, 'plan_limit_user', '0', '2022-09-16 20:41:16', '2022-09-16 20:41:16'),
(15, 19, 'plan_limit', '0', '2022-09-16 20:42:19', '2022-09-16 20:42:19'),
(16, 19, 'plan_limit_user', '0', '2022-09-16 20:42:19', '2022-09-16 20:42:19'),
(17, 20, 'plan_limit', '0', '2022-09-16 20:43:57', '2022-09-16 20:43:57'),
(18, 20, 'plan_limit_user', '0', '2022-09-16 20:43:57', '2022-09-16 20:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `label` varchar(191) DEFAULT NULL,
  `short` varchar(191) DEFAULT NULL,
  `translations` longtext DEFAULT NULL,
  `rtl` enum('1','0') NOT NULL DEFAULT '0',
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `label`, `short`, `translations`, `rtl`, `status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'English', 'ENG', NULL, '', '1', '2022-03-20 22:35:18', '2022-03-20 22:35:18');

-- --------------------------------------------------------

--
-- Table structure for table `ledgers`
--

CREATE TABLE `ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `debit` double DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ledgers`
--

INSERT INTO `ledgers` (`id`, `transaction_id`, `account_id`, `debit`, `credit`, `balance`, `created_at`) VALUES
(1, 2, 1, NULL, 90, 90, '2022-04-14 21:34:05'),
(2, 3, 1, NULL, 2560000, 2560090, '2022-04-14 21:48:41'),
(3, 5, 1, 100, NULL, 2559990, '2022-04-14 21:54:47'),
(4, 9, 4, NULL, 100, 100, '2022-06-01 12:00:10'),
(5, 10, 6, NULL, 100, 100, '2022-06-09 02:36:57'),
(6, 11, 7, NULL, 50, 50, '2022-06-09 02:41:54'),
(7, 12, 4, 100, NULL, 0, '2022-06-09 19:54:29'),
(8, 13, 1, 100, NULL, 2559890, '2022-06-27 18:23:43'),
(9, 14, 1, 100, NULL, 2559790, '2022-06-28 17:45:54'),
(10, 15, 1, 100, NULL, 2559690, '2022-06-28 19:14:17'),
(11, 16, 8, NULL, 100, 100, '2022-06-29 10:36:31'),
(12, 17, 9, NULL, 150, 150, '2022-07-06 09:13:24'),
(13, 18, 9, NULL, 1200, 1350, '2022-07-07 13:01:08'),
(14, 19, 9, NULL, 800, 2150, '2022-07-08 21:53:38'),
(15, 20, 9, NULL, 1698, 3848, '2022-07-08 21:55:26'),
(16, 21, 8, 100, NULL, 0, '2022-07-08 22:08:21'),
(17, 22, 9, 250, NULL, 3598, '2022-07-08 22:16:10'),
(18, 23, 8, NULL, 3760, 3760, '2022-07-08 22:25:09'),
(19, 24, 9, 250, NULL, 3348, '2022-07-10 08:09:45'),
(20, 25, 8, 100, NULL, 3660, '2022-07-28 14:04:10'),
(21, 26, 8, NULL, 18109.6, 21769.6, '2022-08-15 12:29:25'),
(22, 27, 11, NULL, 600, 600, '2022-08-19 08:56:10'),
(23, 28, 11, NULL, 500, 1100, '2022-08-23 14:29:32'),
(24, 29, 11, NULL, 4500, 5600, '2022-08-23 14:30:16'),
(25, 30, 11, 5000, NULL, 600, '2022-08-24 21:41:57'),
(26, 31, 8, NULL, 9881.74, 31651.34, '2022-09-08 02:32:05'),
(27, 32, 11, NULL, 169976.1, 170576.1, '2022-09-12 14:51:11'),
(28, 34, 1, 100, NULL, 2559590, '2022-09-19 18:29:17'),
(29, 50, 15, NULL, 100, 100, '2022-09-24 09:42:01'),
(30, 51, 15, NULL, 5100, 5200, '2022-09-24 10:04:51'),
(31, 52, 15, 5100, NULL, 100, '2022-09-24 10:08:36'),
(32, 53, 15, 100, NULL, 0, '2022-09-24 10:11:57'),
(33, 54, 16, NULL, 100, 100, '2022-09-24 10:34:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_01_04_000000_create_users_table', 1),
(2, '2021_02_17_000000_create_failed_jobs_table', 1),
(3, '2021_04_12_101006_create_verify_tokens_table', 1),
(4, '2021_04_12_101023_create_user_metas_table', 1),
(5, '2021_04_12_101046_create_user_accounts_table', 1),
(6, '2021_04_12_101502_create_user_activities_table', 1),
(7, '2021_04_12_102056_create_referrals_table', 1),
(8, '2021_04_12_102084_create_referral_codes_table', 1),
(9, '2021_04_15_120264_create_settings_table', 1),
(10, '2021_04_15_120392_create_pages_table', 1),
(11, '2021_04_15_120416_create_email_templates_table', 1),
(12, '2021_04_15_120574_create_payment_methods_table', 1),
(13, '2021_04_15_120683_create_withdraw_methods_table', 1),
(14, '2021_04_15_132940_create_accounts_table', 1),
(15, '2021_04_19_132965_create_transactions_table', 1),
(16, '2021_04_19_132996_create_ledgers_table', 1),
(17, '2021_04_19_135150_add_iv_schemes_table', 1),
(18, '2021_04_19_135158_add_iv_scheme_metas_table', 1),
(19, '2021_04_19_135235_add_iv_invests_table', 1),
(20, '2021_04_19_135364_add_iv_ledgers_table', 1),
(21, '2021_04_19_135389_add_iv_profits_table', 1),
(22, '2021_04_19_135458_add_iv_actions_table', 1),
(23, '2021_06_04_162627_create_languages_table', 1),
(24, '2021_08_07_074811_add_scheme_column_in_iv_invest', 1),
(25, '2021_08_07_144326_add_is_locked_column_in_iv_schemes', 1),
(26, '2021_11_19_154153_add_max_column_in_methods', 1),
(27, '2021_11_19_154464_add_pid_column_in_pages', 1),
(28, '2022_03_04_060117_add_deleted_at_column_in_iv_schemes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `menu_name` varchar(191) NOT NULL,
  `menu_link` text DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `subtitle` varchar(191) DEFAULT NULL,
  `seo` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `lang` varchar(191) NOT NULL DEFAULT 'en',
  `status` varchar(191) NOT NULL,
  `pid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `public` tinyint(1) NOT NULL DEFAULT 1,
  `params` text DEFAULT NULL,
  `trash` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `menu_name`, `menu_link`, `title`, `subtitle`, `seo`, `content`, `lang`, `status`, `pid`, `public`, `params`, `trash`, `created_at`, `updated_at`) VALUES
(1, 'About Us', 'about-us', 'About', NULL, 'About the platform', NULL, NULL, '<h4>About the Company</h4>\n<p><strong>[[site_name]]</strong> work in the field of financing promising developments on cryptocurrency market and with blockchain technology. According to experts, blockchain technologies currently have great opportunity. Lots of business ideas related to blockchain technologies become more successful and every day by day it bring high profits to their creators.</p>\n<p>We track and analyze most business ideas. It allows us to get high profits. For our investor do not need to research independently in which project it is more profitable. So our investor can invest their capital and then receive an interest on the profit.</p>\n<h4>Investment</h4>\n<p>We invest in projects at an early stage, in particular, it can be business ideas, investing in startups at various stages of their development, ICO (Initial Coin Offering), IEO (Initial Exchange Offering).</p>', 'en', 'active', 0, 1, NULL, 0, '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(2, 'Our Fees', 'fees', 'Fees', NULL, 'Our Fees', NULL, NULL, NULL, 'en', 'inactive', 0, 1, NULL, 0, '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(3, 'Referral', 'referral', 'Referral', NULL, 'My Referral', 'How does referral work?', '{\"title\":null,\"description\":null,\"keyword\":null}', '<p><strong>How does referral work?</strong></p>\r\n<p>You get 3% on the first deposit your referral deposit into their account.</p>\r\n<p>You can withdraw this immediately.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Note: You can also get a free plan by referrals alone without having to deposit more to get another plan.</p>\r\n<p>&nbsp;</p>\r\n<p>How to get a free bronze plan. You can get a free bronze plan when you refer 5 people via your referral link who would get the full bronze plan each.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Then you can request a free bronze plan when you get the last of your&nbsp; 5th referral.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>How to get a free silver plan. You can get a free silver plan when you refer 5 people via your referral link who would get the full silver plan each.&nbsp;</p>\r\n<p>Then you can request a free silver plan when you get the last of your&nbsp; 5th referral.</p>\r\n<p>How to get a free gold plan. You can get a free gold plan when you refer 5 people via your referral link who would get the full gold plan each.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Then you can request a free gold plan when you get the last of your&nbsp; 5th referral.</p>\r\n<p>&nbsp;</p>\r\n<p>How to get a free diamond plan. You can get a free diamond plan when you refer 5 people via your referral link who would get the full diamond plan each.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Then you can request a free diamond plan when you get the last of your&nbsp; 5th referral.</p>\r\n<p><span style=\"color: #ba372a;\"><strong>Note&nbsp;</strong></span>that you must get at least 2 referrals in your first 30 days of trading to join the free referral plan if you wish to partake in that later in the future ( it&rsquo;s not a must but only if you wish to make use of the free referral plan )&nbsp; then you must get two referrals before the end of the first 30 days.</p>', 'en', 'active', 0, 1, '{\"is_html\":\"off\"}', 0, '2022-03-20 22:35:18', '2022-12-27 11:56:58'),
(4, 'Frequently Asked Questions', 'faqs', 'FAQs', NULL, 'Frequently Asked Questions', NULL, NULL, '<h4>How can we help you?</h4>\n<p>Do You have any questions? We strongly recommend that you start searching for the necessary information in the FAQ section.</p>\n<h5>What is [[site_name]] company?</h5>\n<p>[[site_name]] platform is an international investment company. The activity of our company is aimed at the cryptocurrency trading, forex, stocks and providing investment services worldwide.</p>\n<h5>How to create an account?</h5>\n<p>The registration process on the website is quite simple. You need to fill out the fields of the registration form, which include full name, email address and password.</p>\n<h5>Which payment methods do you accept?</h5>\n<p>At the moment we work with PayPal, Wire Transfer, Bitcoin, Ethereum, Litecoin, Binance Coin.</p>\n<h5>I want to reinvest the funds received, is it possible?</h5>\n<p>Of course. You have the right to reinvesting your profits again and again.</p>', 'en', 'active', 0, 1, NULL, 0, '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(5, 'Contact Us', 'contact-us', 'Contact', NULL, 'Contact Us', NULL, NULL, '<h4>Get In Touch</h4>\n<p>If you need advice or have any question in mind or technical assistance, do not hesitate to contact our specialists.</p>\n<p><strong>Email Address:</strong> [[site_email]]</p>', 'en', 'active', 0, 1, NULL, 0, '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(6, 'Terms and Condition', 'terms-and-condition', 'Terms and Condition', NULL, 'Terms and Condition', NULL, NULL, '<h4>Terms and condition</h4>\n<p>Welcome to [[site_name]]!</p>\n<p>These terms and conditions outline the rules and regulations for the use of [[site_name]]\'s Website.</p>\n<p>By accessing this website we assume you accept these terms and conditions. Do not continue to use [[site_name]] if you do not agree to take all of the terms and conditions stated on this page.</p>\n<p>If you have additional questions or require more information, do not hesitate to contact us through email at [[site_email]].</p>', 'en', 'active', 0, 1, NULL, 0, '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(7, 'Privacy Policy', 'privacy-policy', 'Privacy Policy', NULL, 'Privacy Policy', NULL, NULL, '<h4>Privacy Policy for [[site_name]].</h4>\r\n<p>At <strong>[[site_name]]</strong>, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by <strong>[[site_name]]</strong> and how we use it.\r\n<ul>\r\n<li>users can withdraw their capital after 3 months of trading.</li>\r\n</ul>\r\n</p>\r\n<p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us through email at [[site_email]].</p>', 'en', 'active', 0, 1, NULL, 0, '2022-03-20 22:35:18', '2022-03-20 22:35:18');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `desc` varchar(191) NOT NULL,
  `min_amount` varchar(191) DEFAULT NULL,
  `max_amount` varchar(191) DEFAULT NULL,
  `config` text NOT NULL,
  `fees` text DEFAULT NULL,
  `currencies` text NOT NULL,
  `countries` text DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `slug`, `name`, `desc`, `min_amount`, `max_amount`, `config`, `fees`, `currencies`, `countries`, `status`, `created_at`, `updated_at`) VALUES
(1, 'paypal', 'Paypal', 'Pay securely with your PayPal account.', '5', NULL, '[]', '{\"flat\":0,\"percent\":0}', '[\"USD\"]', '[]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(2, 'bank-transfer', 'Bank Transfer', 'Make payment directly into our bank account.', '100', NULL, '[]', '{\"flat\":0,\"percent\":0}', '[\"USD\"]', '[]', 'inactive', '2022-03-20 22:35:18', '2022-03-20 22:35:18'),
(3, 'crypto-wallet', 'Crypto Wallet', 'Send your payment direct to our wallet.', '0.0050', '500000', '{\"meta\":{\"title\":null,\"fiat\":\"USD\",\"timeout\":\"0\",\"qr\":\"show\"},\"wallet\":{\"BTC\":{\"address\":\"bc1qu9jqt3yt48u607mufh74ee3v7qr4w6hqw3sgmf\",\"wnote\":null,\"network\":\"default\",\"ref\":\"yes\",\"min\":\"0.0050\",\"max\":\"70\"},\"ETH\":{\"address\":\"0x349258313EEBe6CEe3969be6F7B31d0E969A066E\",\"wnote\":null,\"network\":\"default\",\"ref\":\"no\",\"min\":\"0.001\",\"max\":\"700\",\"limit\":null,\"price\":null},\"LTC\":{\"address\":null,\"wnote\":null,\"network\":\"default\",\"ref\":\"no\",\"min\":\"0\",\"max\":\"0\"},\"BCH\":{\"address\":null,\"wnote\":null,\"network\":\"default\",\"ref\":\"no\",\"min\":\"0\",\"max\":\"0\"},\"BNB\":{\"address\":null,\"wnote\":null,\"network\":\"default\",\"ref\":\"no\",\"min\":\"0\",\"max\":\"0\"},\"ADA\":{\"address\":null,\"wnote\":null,\"ref\":\"no\",\"min\":\"0\",\"max\":\"0\"},\"XRP\":{\"address\":null,\"wnote\":null,\"ref\":\"no\",\"min\":\"0\",\"max\":\"0\"},\"USDC\":{\"address\":null,\"wnote\":null,\"network\":\"default\",\"ref\":\"no\",\"min\":\"0\",\"max\":\"0\"},\"USDT\":{\"address\":null,\"wnote\":null,\"network\":\"default\",\"ref\":\"no\",\"min\":\"0\",\"max\":\"0\"},\"TRX\":{\"address\":null,\"wnote\":null,\"network\":\"default\",\"ref\":\"no\",\"min\":\"0\",\"max\":\"0\"}}}', '{\"flat\":0,\"percent\":0}', '[\"BTC\",\"ETH\"]', '[]', 'active', '2022-03-20 22:35:18', '2022-09-22 01:27:17');

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `refer_by` bigint(20) NOT NULL,
  `join_at` datetime NOT NULL,
  `meta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_codes`
--

CREATE TABLE `referral_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL DEFAULT '0',
  `label` varchar(191) DEFAULT NULL,
  `desc` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `referral_codes`
--

INSERT INTO `referral_codes` (`id`, `user_id`, `code`, `type`, `label`, `desc`, `created_at`, `updated_at`) VALUES
(1, 6, '08b1633c', '0', NULL, NULL, '2022-04-20 06:24:51', '2022-04-20 06:24:51'),
(2, 2, '5e6c8eb5', '0', NULL, NULL, '2022-04-20 06:50:17', '2022-04-20 06:50:17'),
(3, 7, 'fadbc791', '0', NULL, NULL, '2022-04-21 10:09:07', '2022-04-21 10:09:07'),
(4, 10, 'bb99ca2e', '0', NULL, NULL, '2022-04-27 03:51:11', '2022-04-27 03:51:11'),
(5, 11, 'cde36ec1', '0', NULL, NULL, '2022-04-28 21:05:50', '2022-04-28 21:05:50'),
(6, 12, '6a42a781', '0', NULL, NULL, '2022-04-29 12:10:49', '2022-04-29 12:10:49'),
(7, 14, '961c7f34', '0', NULL, NULL, '2022-05-01 06:30:29', '2022-05-01 06:30:29'),
(8, 15, '56c20080', '0', NULL, NULL, '2022-05-02 14:45:39', '2022-05-02 14:45:39'),
(9, 17, '149ffc39', '0', NULL, NULL, '2022-05-02 18:46:09', '2022-05-02 18:46:09'),
(10, 22, 'c8565ffb', '0', NULL, NULL, '2022-05-13 04:44:49', '2022-05-13 04:44:49'),
(11, 23, 'b5a7ba9e', '0', NULL, NULL, '2022-05-13 10:54:28', '2022-05-13 10:54:28'),
(12, 25, 'c375d63a', '0', NULL, NULL, '2022-05-19 06:12:40', '2022-05-19 06:12:40'),
(13, 24, 'd34475d7', '0', NULL, NULL, '2022-05-19 15:54:14', '2022-05-19 15:54:14'),
(14, 26, 'f988c253', '0', NULL, NULL, '2022-05-20 15:58:34', '2022-05-20 15:58:34'),
(15, 27, 'f05aaff7', '0', NULL, NULL, '2022-05-22 11:27:51', '2022-05-22 11:27:51'),
(16, 28, '24ae989e', '0', NULL, NULL, '2022-05-22 12:29:06', '2022-05-22 12:29:06'),
(17, 30, '53ae77d5', '0', NULL, NULL, '2022-06-09 02:20:09', '2022-06-09 02:20:09'),
(18, 31, '61651346', '0', NULL, NULL, '2022-06-10 21:56:26', '2022-06-10 21:56:26'),
(19, 32, '2e37ace8', '0', NULL, NULL, '2022-06-12 15:15:44', '2022-06-12 15:15:44'),
(20, 37, '25cc1bf9', '0', NULL, NULL, '2022-06-17 17:32:29', '2022-06-17 17:32:29'),
(21, 40, '01c450e2', '0', NULL, NULL, '2022-07-06 06:05:53', '2022-07-06 06:05:53'),
(22, 42, '4e2569a3', '0', NULL, NULL, '2022-07-24 21:37:31', '2022-07-24 21:37:31'),
(23, 49, '88db5f12', '0', NULL, NULL, '2022-08-04 19:14:46', '2022-08-04 19:14:46'),
(24, 50, 'd4ebf81a', '0', NULL, NULL, '2022-08-14 10:49:06', '2022-08-14 10:49:06'),
(25, 53, '01065052', '0', NULL, NULL, '2022-09-17 12:38:17', '2022-09-17 12:38:17'),
(26, 63, '9c91840e', '0', NULL, NULL, '2022-09-18 11:51:25', '2022-09-18 11:51:25'),
(27, 69, '58277b3b', '0', NULL, NULL, '2022-09-18 14:31:19', '2022-09-18 14:31:19'),
(28, 74, '7cd145aa', '0', NULL, NULL, '2022-09-18 14:51:40', '2022-09-18 14:51:40'),
(29, 75, 'aa312069', '0', NULL, NULL, '2022-09-19 14:07:02', '2022-09-19 14:07:02'),
(30, 76, '89f7dfff', '0', NULL, NULL, '2022-09-20 03:27:04', '2022-09-20 03:27:04'),
(31, 77, 'b744ba98', '0', NULL, NULL, '2022-09-21 13:12:31', '2022-09-21 13:12:31'),
(32, 78, 'a5029614', '0', NULL, NULL, '2022-09-24 10:38:39', '2022-09-24 10:38:39'),
(33, 79, 'd2e3f1d6', '0', NULL, NULL, '2023-01-24 16:11:48', '2023-01-24 16:11:48');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`) VALUES
(1, 'site_name', 'mintcapitalfx', '2022-04-19 10:32:58'),
(2, 'site_email', 'contact@mintcapitalfx.com', '2022-04-19 10:33:25'),
(3, 'site_copyright', ':Sitename &copy; :year. All Rights Reserved.', '2022-03-20 22:35:18'),
(4, 'site_disclaimer', '', '2022-03-20 22:35:18'),
(5, 'site_merchandise', '{\"purchase_code\":\"90908982-90ab-9278-2637-b1b8j103d309\",\"name\":\"segma455\",\"email\":\"serikioluwagbenga@gmail.com\"}', '2022-04-14 21:46:49'),
(6, 'main_website', 'https://mintcapitalfx.com', '2022-04-19 19:24:41'),
(7, 'front_page_enable', 'yes', '2022-03-20 22:35:18'),
(8, 'front_page_extra', 'on', '2022-03-20 22:35:18'),
(9, 'front_page_title', 'Welcome', '2022-03-20 22:35:18'),
(10, 'invest_page_enable', 'yes', '2022-03-20 22:35:18'),
(11, 'time_zone', 'Asia/Dhaka', '2022-03-20 22:35:18'),
(12, 'date_format', 'd M, Y', '2022-03-20 22:35:18'),
(13, 'time_format', 'h:i A', '2022-03-20 22:35:18'),
(14, 'decimal_fiat_display', '4', '2022-09-22 01:51:08'),
(15, 'decimal_crypto_display', '8', '2022-09-22 01:51:08'),
(16, 'decimal_fiat_calc', '4', '2022-09-22 01:51:08'),
(17, 'decimal_crypto_calc', '8', '2022-09-22 01:51:08'),
(18, 'signup_allow', 'enable', '2022-03-20 22:35:18'),
(19, 'email_verification', 'on', '2022-09-18 13:29:27'),
(20, 'batch_update', '120', '2022-03-20 22:35:18'),
(21, 'maintenance_mode', 'off', '2022-03-20 22:35:18'),
(22, 'maintenance_notice', 'We are upgrading our system. Please check after 30 minutes.', '2022-03-20 22:35:18'),
(23, 'mail_from_name', 'mintcapitalfx', '2022-06-27 19:25:48'),
(24, 'mail_from_email', 'noreply@mintcapitalfx.com', '2022-09-18 11:43:14'),
(25, 'mail_global_footer', 'Best Regard, \r\nTeam of [[site_name]]', '2022-04-27 11:44:53'),
(26, 'mail_driver', 'smtp', '2022-04-14 21:53:39'),
(27, 'mail_smtp_host', 'mail.mintcapitalfx.com', '2022-04-27 11:44:53'),
(28, 'mail_smtp_port', '465', '2022-04-14 21:53:39'),
(29, 'mail_smtp_secure', 'ssl', '2022-04-14 21:53:39'),
(30, 'mail_smtp_user', 'noreply@mintcapitalfx.com', '2022-09-16 10:56:28'),
(31, 'mail_smtp_password', 'ssCyjqm2E8-y', '2022-09-16 10:56:28'),
(32, 'mail_recipient', 'support@mintcapitalfx.com', '2022-09-18 11:43:14'),
(33, 'mail_recipient_alter', '', '2022-03-20 22:35:18'),
(34, 'youtube_link', '', '2022-03-20 22:35:18'),
(35, 'linkedin_link', '', '2022-03-20 22:35:18'),
(36, 'twitter_link', '', '2022-03-20 22:35:18'),
(37, 'facebook_link', '', '2022-03-20 22:35:18'),
(38, 'medium_link', '', '2022-03-20 22:35:18'),
(39, 'telegram_link', '', '2022-03-20 22:35:18'),
(40, 'github_link', '', '2022-03-20 22:35:18'),
(41, 'pinterest_link', '', '2022-03-20 22:35:18'),
(42, 'app_acquire', '{\"app\":\"mintcapitalfx\",\"secret\":\"a12245678999ca31eeb350462ba6c328\",\"cipher\":\"2ba6c328\",\"key\":\"245678\",\"update\":\"2537354402\"}', '2022-12-29 10:24:38'),
(43, 'exratesapi_access_key', '', '2022-04-14 22:23:37'),
(44, 'recaptcha_site_key', '', '2022-03-20 22:35:18'),
(45, 'recaptcha_secret_key', '', '2022-03-20 22:35:18'),
(46, 'custom_stylesheet', 'off', '2022-03-20 22:35:18'),
(47, 'header_code', '', '2022-03-20 22:35:18'),
(48, 'footer_code', '', '2022-03-20 22:35:18'),
(49, 'main_nav', '[1,4,5]', '2022-03-20 17:35:18'),
(50, 'main_menu', '[]', '2022-03-20 22:35:18'),
(51, 'footer_menu', '[4,6,7]', '2022-03-20 17:35:18'),
(52, 'page_terms', '6', '2022-03-20 17:35:18'),
(53, 'page_privacy', '7', '2022-03-20 17:35:18'),
(54, 'page_fee_deposit', '', '2022-03-20 22:35:18'),
(55, 'page_fee_withdraw', '', '2022-03-20 22:35:18'),
(56, 'page_contact', '5', '2022-03-20 17:35:18'),
(57, 'page_contact_form', 'on', '2022-03-20 22:35:18'),
(58, 'ui_page_skin', 'dark', '2022-03-20 22:35:18'),
(59, 'ui_auth_skin', 'dark', '2022-03-20 22:35:18'),
(60, 'ui_auth_layout', 'default', '2022-03-20 22:35:18'),
(61, 'ui_theme_mode', 'light', '2022-03-20 22:35:18'),
(62, 'ui_theme_skin', 'default', '2022-03-20 22:35:18'),
(63, 'ui_sidebar_user', 'white', '2022-03-20 22:35:18'),
(64, 'ui_sidebar_admin', 'darker', '2022-04-18 14:35:25'),
(65, 'ui_theme_mode_admin', 'light', '2022-03-20 22:35:18'),
(66, 'ui_theme_skin_admin', 'default', '2022-03-20 22:35:18'),
(67, 'payout_batch', 'a12245678999ca31eeb350462ba6c328', '2022-12-29 10:24:38'),
(68, 'signup_bonus_allow', 'no', '2022-03-20 22:35:18'),
(69, 'signup_bonus_amount', '0', '2022-03-20 22:35:18'),
(70, 'deposit_bonus_allow', 'no', '2022-03-20 22:35:18'),
(71, 'deposit_bonus_amount', '0', '2022-03-20 22:35:18'),
(72, 'deposit_bonus_type', 'fixed', '2022-03-20 22:35:18'),
(73, 'referral_system', 'yes', '2022-04-19 21:25:38'),
(74, 'referral_invite_title', 'Refer Us & Earn', '2022-03-20 22:35:18'),
(75, 'referral_invite_text', 'Use the below link to invite your friends.', '2022-03-20 22:35:18'),
(76, 'referral_signup_user', 'no', '2022-03-20 22:35:18'),
(77, 'referral_signup_user_bonus', '0', '2022-03-20 22:35:18'),
(78, 'referral_signup_user_reward', 'no', '2022-03-20 22:35:18'),
(79, 'referral_deposit_user', 'no', '2022-03-20 22:35:18'),
(80, 'referral_deposit_user_bonus', '0', '2022-03-20 22:35:18'),
(81, 'referral_deposit_user_type', 'percent', '2022-03-20 22:35:18'),
(82, 'referral_signup_referer', 'no', '2022-03-20 22:35:18'),
(83, 'referral_signup_referer_bonus', '0', '2022-03-20 22:35:18'),
(84, 'referral_deposit_referer', 'yes', '2022-09-17 15:30:33'),
(85, 'referral_deposit_referer_bonus', '3', '2022-09-17 15:30:33'),
(86, 'referral_deposit_referer_type', 'percent', '2022-03-20 22:35:18'),
(87, 'alert_wd_account', 'on', '2022-03-20 22:35:18'),
(88, 'alert_profile_basic', 'on', '2022-03-20 22:35:18'),
(89, 'header_notice_show', 'no', '2022-03-20 22:35:18'),
(90, 'header_notice_title', '', '2022-03-20 22:35:18'),
(91, 'header_notice_text', '', '2022-03-20 22:35:18'),
(92, 'header_notice_link', '', '2022-03-20 22:35:18'),
(93, 'system_service', 'BJYIRPBMQV245678', '2023-01-24 16:11:29'),
(94, 'api_service', 'no', '2022-04-14 21:58:23'),
(95, 'deposit_service', 'a90c6258', '2022-04-14 21:46:50'),
(96, 'deposit_limit_request', '0', '2022-03-20 22:35:18'),
(97, 'deposit_cancel_timeout', 'yes', '2022-03-20 22:35:18'),
(98, 'deposit_fiat_minimum', '1', '2022-03-20 22:35:18'),
(99, 'deposit_crypto_minimum', '1', '2022-04-14 21:55:36'),
(100, 'deposit_fiat_maximum', '100000', '2022-04-14 21:55:36'),
(101, 'deposit_crypto_maximum', '100000', '2022-04-14 21:55:36'),
(102, 'deposit_disable_request', 'no', '2022-03-20 22:35:18'),
(103, 'deposit_disable_title', 'Temporarily unavailable!', '2022-03-20 22:35:18'),
(104, 'deposit_disable_notice', 'Sorry, we are upgrading our deposit system. Please check after sometimes. We apologize for any inconvenience.', '2022-03-20 22:35:18'),
(105, 'payout_check', '2537354402', '2023-01-24 16:11:29'),
(106, 'withdraw_service', 'a90c6258', '2022-04-14 21:46:50'),
(107, 'withdraw_limit_request', '0', '2022-03-20 22:35:18'),
(108, 'withdraw_cancel_timeout', 'yes', '2022-03-20 22:35:18'),
(109, 'withdraw_fiat_minimum', '10', '2022-03-20 22:35:18'),
(110, 'withdraw_fiat_maximum', '100000', '2022-04-14 21:55:36'),
(111, 'withdraw_crypto_minimum', '1', '2022-04-14 21:55:36'),
(112, 'withdraw_crypto_maximum', '100000', '2022-04-14 21:55:36'),
(113, 'withdraw_disable_request', 'no', '2022-03-20 22:35:18'),
(114, 'withdraw_disable_title', 'Temporarily unavailable!', '2022-03-20 22:35:18'),
(115, 'withdraw_disable_notice', 'Sorry, we are upgrading our withdrawal system. Please check after sometimes. We apologize for any inconvenience.', '2022-03-20 22:35:18'),
(116, 'app_queue', '0', '2022-03-20 22:35:18'),
(117, 'base_currency', 'USD', '2022-03-20 22:35:18'),
(118, 'alter_currency', 'BTC', '2022-04-14 21:54:12'),
(119, 'supported_currency', '{\"USD\":\"on\",\"BTC\":\"on\",\"ETH\":\"on\"}', '2022-04-19 21:21:30'),
(120, 'fiat_rounded', 'up', '2022-04-16 18:53:48'),
(121, 'crypto_rounded', 'down', '2022-04-16 18:53:48'),
(122, 'exchange_method', 'manual', '2022-04-15 15:06:03'),
(123, 'exchange_auto_update', '20', '2022-04-14 22:00:56'),
(124, 'exchange_last_update', '1647797718', '2022-03-20 22:35:18'),
(125, 'manual_exchange_rate', '{\"USD\":\"1\",\"BTC\":\"0.000053\",\"ETH\":\"0.00075238\"}', '2022-09-21 08:46:59'),
(126, 'health_checker', '1', '2022-05-13 20:54:22'),
(127, 'top_iv_plan_x0', '3', '2022-03-20 17:35:18'),
(128, 'top_iv_plan_x1', '1', '2022-03-20 17:35:18'),
(129, 'top_iv_plan_x2', '2', '2022-03-20 17:35:18'),
(130, 'iv_plan_order', 'featured', '2022-03-20 22:35:18'),
(131, 'iv_show_plans', 'default', '2022-03-20 22:35:18'),
(132, 'iv_plan_desc_show', 'no', '2022-03-20 22:35:18'),
(133, 'iv_plan_total_percent', 'yes', '2022-03-20 22:35:18'),
(134, 'iv_plan_pg_heading', 'Investment Plans', '2022-03-20 22:35:18'),
(135, 'iv_plan_pg_title', 'Choose your favourite plan and start earning now.', '2022-03-20 22:35:18'),
(136, 'iv_plan_pg_text', 'Here is our several investment plans. You can invest daily, weekly or monthly and get higher returns in your investment.', '2022-03-20 22:35:18'),
(137, 'iv_launched_date', '03/20/2022', '2022-03-20 22:35:18'),
(138, 'iv_cancel_timeout', '15', '2022-03-20 22:35:18'),
(139, 'iv_admin_confirmtion', 'yes', '2022-03-20 22:35:18'),
(140, 'iv_disable_purchase', 'no', '2022-03-20 22:35:18'),
(141, 'iv_disable_title', 'Temporarily unavailable!', '2022-03-20 22:35:18'),
(142, 'iv_disable_notice', '', '2022-03-20 22:35:18'),
(143, 'iv_profit_payout', 'everytime', '2022-03-20 22:35:18'),
(144, 'iv_profit_payout_amount', '100', '2022-03-20 22:35:18'),
(145, 'iv_plan_fx_currencies', '[]', '2022-03-20 22:35:18'),
(146, 'iv_weekend_days', '[]', '2022-03-20 22:35:18'),
(147, 'language_default_public', 'en', '2022-03-20 22:35:18'),
(148, 'language_default_system', 'en', '2022-03-20 22:35:18'),
(149, 'language_show_as', 'default', '2022-03-20 22:35:18'),
(150, 'language_switcher', 'off', '2022-03-20 22:35:18'),
(151, 'social_auth', 'off', '2022-03-20 22:35:18'),
(152, 'gdpr_enable', 'no', '2022-03-20 22:35:18'),
(153, 'cookie_consent_text', 'This website uses cookies. By continuing to use this website, you agree to their use. For details, please check our [[privacy]].', '2022-03-20 22:35:18'),
(154, 'referral_show_referred_users', 'yes', '2022-04-19 21:25:38'),
(155, 'referral_user_table_opts', '[\"earning\",\"compact\",null]', '2022-04-19 21:25:38'),
(156, 'referral_invite_redirect', 'register', '2022-03-20 22:35:18'),
(157, 'cookie_banner_position', 'bbox-left', '2022-03-20 22:35:18'),
(158, 'cookie_banner_background', 'light', '2022-03-20 22:35:18'),
(159, 'seo_description', '', '2022-03-20 22:35:18'),
(160, 'login_seo_title', '', '2022-03-20 22:35:18'),
(161, 'registration_seo_title', '', '2022-03-20 22:35:18'),
(162, 'og_title', '', '2022-03-20 22:35:18'),
(163, 'og_description', '', '2022-03-20 22:35:18'),
(164, 'header_notice_date', '', '2022-03-20 22:35:18'),
(165, 'deposit_amount_base', 'yes', '2022-09-20 17:00:29'),
(166, 'rates_ticker_display', 'yes', '2022-04-26 22:39:01'),
(167, 'rates_ticker_from', 'base', '2022-03-20 22:35:18'),
(168, 'rates_ticker_fx', 'all', '2022-04-26 22:39:01'),
(169, 'iv_plan_capital_show', 'yes', '2022-03-20 22:35:18'),
(170, 'iv_plan_payout_show', 'no', '2022-03-20 22:35:18'),
(171, 'iv_plan_terms_show', 'no', '2022-03-20 22:35:18'),
(172, 'application_rcv', '2120115', '2022-03-20 22:35:18'),
(173, 'update_installed', '1649972699', '2022-04-14 21:44:59'),
(174, 'installed_apps', '1649863716', '2022-04-13 14:28:36'),
(175, 'baseurl_apps', 'app.thecexio.com/public', '2023-04-13 11:21:04'),
(176, 'system_super_admin', '1', '2022-04-14 20:47:16'),
(177, 'system_mailer_tested', '1663501409', '2022-09-18 11:43:29'),
(178, 'quick_setup_done', '1663501450', '2022-09-18 11:44:10'),
(179, 'exratesapi_error_msg', 'Access key was not sepecified in application.', '2023-01-24 16:11:36'),
(180, 'tawk_api_key', '5ff61179a9a34e36b969c744', '2022-04-26 22:32:59'),
(181, 'recaptcha_score', '6', '2022-04-14 21:02:43'),
(182, 'cache_version', '1663810188', '2022-09-22 01:29:48'),
(183, 'payout_locked_profit', NULL, '2022-09-08 00:22:46'),
(184, 'payout_locked_plan', NULL, '2022-06-09 03:32:45'),
(185, 'instagram_link', '', '2022-04-19 09:32:58'),
(186, 'whatsapp_link', '', '2022-04-19 09:32:58'),
(187, 'reddit_link', '', '2022-04-19 09:32:58'),
(188, 'website_logo_light2x', 'brand/zdt3kg3cNLgtm1wt1ycKvDc4oZbS6swDZXkG9PCv.png', '2022-12-29 10:38:38'),
(189, 'website_logo_dark2x', 'brand/aJUU6XQn1R7kNMcXQhz9mdDHMG2L4rjtUcUecQm4.png', '2022-12-29 10:38:50'),
(190, 'website_logo_light', 'brand/U1k36zkRsJN5nm1x0YrYzrJls3sGbfSpVn0nr5BX.png', '2022-12-29 10:39:15'),
(191, 'website_logo_dark', 'brand/KAHnnUngfX7yBpEV75tkeaP3R8DHURogbWLmgnmD.png', '2022-12-29 10:39:49'),
(192, 'website_logo_mail', 'brand/VsP8UXibxhAk99ej9OOivgz2DJRDzu8BewmXdFvB.png', '2022-12-29 10:39:03'),
(193, 'referral_deposit_user_allow', 'only', '2022-04-19 20:25:38'),
(194, 'referral_deposit_user_max', '', '2022-04-19 20:25:38'),
(195, 'referral_deposit_referer_allow', 'only', '2022-09-19 20:20:36'),
(196, 'referral_deposit_referer_max', '2', '2022-09-17 15:30:33'),
(197, 'support_card_show', 'no', '2022-04-26 21:39:01'),
(198, 'support_card_title', '', '2022-04-26 21:39:01'),
(199, 'support_card_text', '', '2022-04-26 21:39:01'),
(200, 'support_card_link', '', '2022-04-26 21:39:01'),
(201, 'rates_ticker_currencies', '[]', '2022-04-26 21:39:01'),
(202, 'signup_form_fields', '{\"profile_phone\":{\"show\":\"no\",\"req\":\"no\"},\"profile_dob\":{\"show\":\"no\",\"req\":\"no\"},\"profile_country\":{\"show\":\"no\",\"req\":\"no\"}}', '2022-09-17 06:34:15');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tnx` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `account_to` bigint(20) DEFAULT NULL,
  `account_from` bigint(20) DEFAULT NULL,
  `calc` varchar(191) NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `fees` double NOT NULL DEFAULT 0,
  `currency` varchar(191) NOT NULL,
  `total` double NOT NULL DEFAULT 0,
  `tnx_amount` double NOT NULL DEFAULT 0,
  `tnx_fees` double NOT NULL DEFAULT 0,
  `tnx_total` double NOT NULL DEFAULT 0,
  `tnx_currency` varchar(191) NOT NULL,
  `tnx_method` varchar(191) DEFAULT NULL,
  `exchange` double NOT NULL DEFAULT 0,
  `status` varchar(191) NOT NULL,
  `refund` bigint(20) DEFAULT 0,
  `pay_from` varchar(191) DEFAULT NULL,
  `pay_to` varchar(191) DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `remarks` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `meta` text NOT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmed_by` text DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `completed_by` text DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `real_pass` varchar(250) DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `role` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `refer` varchar(191) DEFAULT NULL,
  `2fa` varchar(191) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `email`, `real_pass`, `password`, `role`, `status`, `last_login`, `refer`, `2fa`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'superadmin', 'Mint Capital FXadmin', 'support@mintcapitalfx.com', NULL, '$2y$10$u6BaM0C3inYlbKewVi2Q4OIA7o0.mR6wvF2k68.PoGLGkReRoxiMO', 'super-admin', 'active', '2022-12-29 19:47:01', NULL, '0', 'uBuaGRmM5EuMsIjfJVvOgACaROV8vrk2pbdYJcTKXHBs0cuoEyFh2pSHsEaQ', '2022-04-14 20:47:16', '2022-12-29 19:47:01', NULL),
(79, 'ali200', 'ali ali', 'hammadarlis2@gmail.com', '8MHr2htWZ29iRXU', '$2y$10$fivns4LYnFZZN186fc7izugEK0alYZphe4p5LJgmwCaNrCtd9XxCC', 'user', 'active', '2023-01-24 16:11:29', NULL, '0', NULL, '2023-01-24 16:10:38', '2023-01-24 16:11:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `config` text NOT NULL,
  `last_used` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_activities`
--

CREATE TABLE `user_activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `session` datetime NOT NULL,
  `ip` varchar(45) NOT NULL,
  `meta` text NOT NULL,
  `browser` varchar(191) NOT NULL,
  `device` varchar(191) NOT NULL,
  `platform` varchar(191) NOT NULL,
  `version` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_activities`
--

INSERT INTO `user_activities` (`id`, `user_id`, `session`, `ip`, `meta`, `browser`, `device`, `platform`, `version`) VALUES
(1, 1, '2022-12-29 10:24:38', '146.70.99.197', 'User Logged in', 'Chrome', 'WebKit', 'Windows', '{\"browser\":\"108.0.0.0\",\"platform\":\"10.0\"}'),
(2, 1, '2022-12-29 12:19:44', '146.70.99.171', 'User Logged in', 'Chrome', 'WebKit', 'Windows', '{\"browser\":\"108.0.0.0\",\"platform\":\"10.0\"}'),
(3, 1, '2022-12-29 19:47:01', '104.33.135.18', 'User Logged in', 'Chrome', 'WebKit', 'Windows', '{\"browser\":\"108.0.0.0\",\"platform\":\"10.0\"}'),
(4, 79, '2023-01-24 16:11:29', '119.160.56.100', 'User Logged in', 'Chrome', 'WebKit', 'Windows', '{\"browser\":\"109.0.0.0\",\"platform\":\"10.0\"}');

-- --------------------------------------------------------

--
-- Table structure for table `user_metas`
--

CREATE TABLE `user_metas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `meta_key` varchar(191) NOT NULL,
  `meta_value` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_metas`
--

INSERT INTO `user_metas` (`id`, `user_id`, `meta_key`, `meta_value`, `created_at`, `updated_at`) VALUES
(1, 1, 'profile_display_name', 'Admin', '2022-04-14 20:47:16', '2022-04-19 19:36:02'),
(2, 1, 'profile_avatar_bg', 'blue', '2022-04-14 20:47:16', '2022-04-14 20:47:16'),
(3, 1, 'profile_display_full_name', 'off', '2022-04-14 20:47:16', '2022-04-19 19:36:02'),
(4, 1, 'setting_activity_log', 'on', '2022-04-14 20:47:16', '2022-04-14 20:47:16'),
(5, 1, 'setting_unusual_activity', 'on', '2022-04-14 20:47:16', '2022-04-14 20:47:16'),
(6, 1, 'registration_method', 'system', '2022-04-14 20:47:16', '2022-04-14 20:47:16'),
(7, 1, 'email_verified', '2022-04-14 21:47:16', '2022-04-14 20:47:16', '2022-04-14 20:47:16'),
(8, 1, 'email_verified_last', '2022-04-14 21:47:16', '2022-04-14 20:47:16', '2022-04-14 20:47:16'),
(9, 1, 'first_login_at', '2022-04-14 21:47:26', '2022-04-14 20:47:26', '2022-04-14 20:47:26'),
(10, 2, 'profile_display_name', 'Fair', '2022-04-14 21:04:28', '2022-04-14 21:04:28'),
(11, 2, 'profile_avatar_bg', 'orange', '2022-04-14 21:04:28', '2022-04-14 21:04:28'),
(12, 2, 'profile_display_full_name', 'on', '2022-04-14 21:04:28', '2022-04-14 21:04:28'),
(13, 2, 'setting_activity_log', 'on', '2022-04-14 21:04:28', '2022-04-14 21:04:28'),
(14, 2, 'setting_unusual_activity', 'on', '2022-04-14 21:04:28', '2022-04-14 21:04:28'),
(15, 2, 'registration_method', 'email', '2022-04-14 21:04:28', '2022-04-14 21:04:28'),
(16, 2, 'email_verified', '2022-04-14 22:04:52', '2022-04-14 21:04:52', '2022-04-14 21:04:52'),
(17, 2, 'email_verified_last', '2022-04-14 22:04:52', '2022-04-14 21:04:52', '2022-04-14 21:04:52'),
(18, 2, 'first_login_at', '2022-04-14 22:05:12', '2022-04-14 21:05:12', '2022-04-14 21:05:12'),
(19, 2, 'profile_phone', '5809774669', '2022-04-14 21:05:38', '2022-04-14 21:05:38'),
(20, 2, 'profile_dob', '02/15/2000', '2022-04-14 21:05:38', '2022-04-14 21:05:38'),
(21, 2, 'profile_country', 'United Kingdom', '2022-04-14 21:05:38', '2022-04-14 21:05:38'),
(22, 3, 'profile_display_name', 'tunde', '2022-04-19 11:43:57', '2022-04-19 11:43:57'),
(23, 3, 'profile_avatar_bg', 'primary', '2022-04-19 11:43:57', '2022-04-19 11:43:57'),
(24, 3, 'profile_display_full_name', 'on', '2022-04-19 11:43:57', '2022-04-19 11:43:57'),
(25, 3, 'setting_activity_log', 'on', '2022-04-19 11:43:57', '2022-04-19 11:43:57'),
(26, 3, 'setting_unusual_activity', 'on', '2022-04-19 11:43:57', '2022-04-19 11:43:57'),
(27, 3, 'registration_method', 'email', '2022-04-19 11:43:57', '2022-04-19 11:43:57'),
(28, 4, 'profile_display_name', 'stone', '2022-04-19 12:22:39', '2022-04-19 12:22:39'),
(29, 4, 'profile_avatar_bg', 'teal', '2022-04-19 12:22:39', '2022-04-19 12:22:39'),
(30, 4, 'profile_display_full_name', 'on', '2022-04-19 12:22:39', '2022-04-19 12:22:39'),
(31, 4, 'setting_activity_log', 'on', '2022-04-19 12:22:39', '2022-04-19 12:22:39'),
(32, 4, 'setting_unusual_activity', 'on', '2022-04-19 12:22:39', '2022-04-19 12:22:39'),
(33, 4, 'registration_method', 'email', '2022-04-19 12:22:39', '2022-04-19 12:22:39'),
(34, 5, 'profile_display_name', 'stone', '2022-04-19 12:41:11', '2022-04-19 12:41:11'),
(35, 5, 'profile_avatar_bg', 'teal', '2022-04-19 12:41:11', '2022-04-19 12:41:11'),
(36, 5, 'profile_display_full_name', 'on', '2022-04-19 12:41:11', '2022-04-19 12:41:11'),
(37, 5, 'setting_activity_log', 'on', '2022-04-19 12:41:11', '2022-04-19 12:41:11'),
(38, 5, 'setting_unusual_activity', 'on', '2022-04-19 12:41:11', '2022-04-19 12:41:11'),
(39, 5, 'registration_method', 'email', '2022-04-19 12:41:11', '2022-04-19 12:41:11'),
(40, 1, 'profile_phone', '', '2022-04-19 19:36:02', '2022-04-19 19:36:02'),
(41, 1, 'profile_dob', '', '2022-04-19 19:36:02', '2022-04-19 19:36:02'),
(42, 1, 'profile_telegram', '', '2022-04-19 19:36:02', '2022-04-19 19:36:02'),
(43, 1, 'user_new_email', NULL, '2022-04-19 19:39:05', '2022-04-19 20:01:56'),
(44, 1, 'user_old_email', 'serikioluwagbenga@gmail.com', '2022-04-19 20:01:56', '2022-04-19 20:01:56'),
(45, 1, 'last_email_changed', '1650402116', '2022-04-19 20:01:56', '2022-04-19 20:01:56'),
(46, 1, 'last_password_changed', '1650402239', '2022-04-19 20:03:59', '2022-04-19 20:03:59'),
(47, 6, 'profile_display_name', 'ramzi', '2022-04-20 06:20:35', '2022-04-20 06:20:35'),
(48, 6, 'profile_avatar_bg', 'gray', '2022-04-20 06:20:35', '2022-04-20 06:20:35'),
(49, 6, 'profile_display_full_name', 'on', '2022-04-20 06:20:35', '2022-04-20 06:20:35'),
(50, 6, 'setting_activity_log', 'on', '2022-04-20 06:20:35', '2022-04-20 06:20:35'),
(51, 6, 'setting_unusual_activity', 'on', '2022-04-20 06:20:35', '2022-04-20 06:20:35'),
(52, 6, 'registration_method', 'email', '2022-04-20 06:20:35', '2022-04-20 06:20:35'),
(53, 6, 'email_verified', '2022-04-20 07:21:12', '2022-04-20 06:21:12', '2022-04-20 06:21:12'),
(54, 6, 'email_verified_last', '2022-04-20 07:21:14', '2022-04-20 06:21:12', '2022-04-20 06:21:14'),
(55, 6, 'first_login_at', '2022-04-20 07:22:38', '2022-04-20 06:22:38', '2022-04-20 06:22:38'),
(56, 6, 'profile_phone', '3281248884', '2022-04-20 06:23:45', '2022-04-20 06:23:45'),
(57, 6, 'profile_dob', '02/27/2004', '2022-04-20 06:23:45', '2022-04-20 06:23:45'),
(58, 6, 'profile_country', 'Italy', '2022-04-20 06:23:45', '2022-04-20 06:23:45'),
(59, 7, 'profile_display_name', 'Amadeo', '2022-04-21 10:05:13', '2022-04-21 10:11:01'),
(60, 7, 'profile_avatar_bg', 'teal', '2022-04-21 10:05:13', '2022-04-21 10:05:13'),
(61, 7, 'profile_display_full_name', 'on', '2022-04-21 10:05:13', '2022-04-21 10:05:13'),
(62, 7, 'setting_activity_log', 'on', '2022-04-21 10:05:13', '2022-04-21 10:05:13'),
(63, 7, 'setting_unusual_activity', 'on', '2022-04-21 10:05:13', '2022-04-21 10:05:13'),
(64, 7, 'registration_method', 'email', '2022-04-21 10:05:13', '2022-04-21 10:05:13'),
(65, 7, 'email_verified', '2022-04-21 11:06:09', '2022-04-21 10:06:09', '2022-04-21 10:06:09'),
(66, 7, 'email_verified_last', '2022-04-21 11:06:09', '2022-04-21 10:06:09', '2022-04-21 10:06:09'),
(67, 7, 'first_login_at', '2022-04-21 11:06:37', '2022-04-21 10:06:37', '2022-04-21 10:06:37'),
(68, 7, 'profile_phone', '00385997944154', '2022-04-21 10:11:01', '2022-06-01 07:39:50'),
(69, 7, 'profile_dob', '11/27/1998', '2022-04-21 10:11:01', '2022-04-21 10:11:01'),
(70, 7, 'profile_telegram', '', '2022-04-21 10:11:01', '2022-04-21 10:11:01'),
(71, 7, 'profile_gender', 'male', '2022-04-21 10:11:01', '2022-04-21 10:11:01'),
(72, 8, 'profile_display_name', 'Jermaine', '2022-04-27 03:32:28', '2022-04-27 03:32:28'),
(73, 8, 'profile_avatar_bg', 'primary', '2022-04-27 03:32:28', '2022-04-27 03:32:28'),
(74, 8, 'profile_display_full_name', 'on', '2022-04-27 03:32:28', '2022-04-27 03:32:28'),
(75, 8, 'setting_activity_log', 'on', '2022-04-27 03:32:28', '2022-04-27 03:32:28'),
(76, 8, 'setting_unusual_activity', 'on', '2022-04-27 03:32:28', '2022-04-27 03:32:28'),
(77, 8, 'registration_method', 'email', '2022-04-27 03:32:28', '2022-04-27 03:32:28'),
(78, 8, 'email_verified', '2022-04-27 04:40:11', '2022-04-27 03:40:11', '2022-04-27 03:40:11'),
(79, 8, 'email_verified_last', '2022-04-27 04:40:12', '2022-04-27 03:40:12', '2022-04-27 03:40:12'),
(80, 10, 'profile_display_name', 'Morrison', '2022-04-27 03:44:05', '2022-04-27 03:44:05'),
(81, 10, 'profile_avatar_bg', 'info', '2022-04-27 03:44:05', '2022-04-27 03:44:05'),
(82, 10, 'profile_display_full_name', 'on', '2022-04-27 03:44:05', '2022-04-27 03:44:05'),
(83, 10, 'setting_activity_log', 'on', '2022-04-27 03:44:05', '2022-04-27 03:44:05'),
(84, 10, 'setting_unusual_activity', 'on', '2022-04-27 03:44:05', '2022-04-27 03:44:05'),
(85, 10, 'registration_method', 'email', '2022-04-27 03:44:05', '2022-04-27 03:44:05'),
(86, 10, 'email_verified', '2022-04-27 04:44:31', '2022-04-27 03:44:31', '2022-04-27 03:44:31'),
(87, 10, 'email_verified_last', '2022-04-27 04:44:32', '2022-04-27 03:44:32', '2022-04-27 03:44:32'),
(88, 10, 'first_login_at', '2022-04-27 04:45:21', '2022-04-27 03:45:21', '2022-04-27 03:45:21'),
(89, 11, 'profile_display_name', 'Zaf', '2022-04-28 20:51:41', '2022-04-28 21:03:02'),
(90, 11, 'profile_avatar_bg', 'blue', '2022-04-28 20:51:41', '2022-04-28 20:51:41'),
(91, 11, 'profile_display_full_name', 'on', '2022-04-28 20:51:41', '2022-04-28 20:51:41'),
(92, 11, 'setting_activity_log', 'on', '2022-04-28 20:51:41', '2022-04-28 20:51:41'),
(93, 11, 'setting_unusual_activity', 'on', '2022-04-28 20:51:41', '2022-04-28 20:51:41'),
(94, 11, 'registration_method', 'email', '2022-04-28 20:51:41', '2022-04-28 20:51:41'),
(95, 11, 'email_verified', '2022-04-28 21:53:22', '2022-04-28 20:53:22', '2022-04-28 20:53:22'),
(96, 11, 'email_verified_last', '2022-04-28 21:53:22', '2022-04-28 20:53:22', '2022-04-28 20:53:22'),
(97, 11, 'first_login_at', '2022-04-28 21:54:02', '2022-04-28 20:54:02', '2022-04-28 20:54:02'),
(98, 11, 'profile_phone', '725-724-8456', '2022-04-28 21:03:02', '2022-04-28 21:03:02'),
(99, 11, 'profile_phone', '725-724-8456', '2022-04-28 21:03:02', '2022-04-28 21:03:02'),
(100, 11, 'profile_phone', '725-724-8456', '2022-04-28 21:03:02', '2022-04-28 21:03:02'),
(101, 11, 'profile_phone', '725-724-8456', '2022-04-28 21:03:02', '2022-04-28 21:03:02'),
(102, 11, 'profile_phone', '725-724-8456', '2022-04-28 21:03:02', '2022-04-28 21:03:02'),
(103, 11, 'profile_phone', '725-724-8456', '2022-04-28 21:03:02', '2022-04-28 21:03:02'),
(104, 11, 'profile_phone', '725-724-8456', '2022-04-28 21:03:02', '2022-04-28 21:03:02'),
(105, 11, 'profile_dob', '04/13/2004', '2022-04-28 21:03:02', '2022-04-28 21:03:02'),
(106, 11, 'profile_dob', '04/13/2004', '2022-04-28 21:03:02', '2022-04-28 21:03:02'),
(107, 11, 'profile_dob', '04/13/2004', '2022-04-28 21:03:02', '2022-04-28 21:03:02'),
(108, 11, 'profile_dob', '04/13/2004', '2022-04-28 21:03:02', '2022-04-28 21:03:02'),
(109, 11, 'profile_dob', '04/13/2004', '2022-04-28 21:03:02', '2022-04-28 21:03:02'),
(110, 11, 'profile_dob', '04/13/2004', '2022-04-28 21:03:02', '2022-04-28 21:03:02'),
(111, 11, 'profile_dob', '04/13/2004', '2022-04-28 21:03:02', '2022-04-28 21:03:02'),
(112, 11, 'profile_dob', '04/13/2004', '2022-04-28 21:03:02', '2022-04-28 21:03:02'),
(113, 11, 'profile_country', 'United States', '2022-04-28 21:03:02', '2022-04-28 21:03:02'),
(114, 12, 'profile_display_name', 'Crawford', '2022-04-29 11:59:24', '2022-04-29 11:59:24'),
(115, 12, 'profile_avatar_bg', 'blue', '2022-04-29 11:59:24', '2022-04-29 11:59:24'),
(116, 12, 'profile_display_full_name', 'on', '2022-04-29 11:59:24', '2022-04-29 11:59:24'),
(117, 12, 'setting_activity_log', 'on', '2022-04-29 11:59:24', '2022-04-29 11:59:24'),
(118, 12, 'setting_unusual_activity', 'on', '2022-04-29 11:59:24', '2022-04-29 11:59:24'),
(119, 12, 'registration_method', 'email', '2022-04-29 11:59:24', '2022-04-29 11:59:24'),
(120, 12, 'email_verified', '2022-04-29 13:04:05', '2022-04-29 12:04:05', '2022-04-29 12:04:05'),
(121, 12, 'email_verified_last', '2022-04-29 13:04:05', '2022-04-29 12:04:05', '2022-04-29 12:04:05'),
(122, 12, 'first_login_at', '2022-04-29 13:04:35', '2022-04-29 12:04:35', '2022-04-29 12:04:35'),
(123, 12, 'profile_phone', '7155300690', '2022-04-29 12:06:10', '2022-04-29 12:06:10'),
(124, 12, 'profile_dob', '08/11/2003', '2022-04-29 12:06:10', '2022-04-29 12:06:10'),
(125, 12, 'profile_country', 'United States', '2022-04-29 12:06:10', '2022-04-29 12:06:10'),
(126, 13, 'profile_display_name', 'Rex', '2022-04-29 12:15:09', '2022-04-29 12:15:09'),
(127, 13, 'profile_avatar_bg', 'success', '2022-04-29 12:15:09', '2022-04-29 12:15:09'),
(128, 13, 'profile_display_full_name', 'on', '2022-04-29 12:15:09', '2022-04-29 12:15:09'),
(129, 13, 'setting_activity_log', 'on', '2022-04-29 12:15:09', '2022-04-29 12:15:09'),
(130, 13, 'setting_unusual_activity', 'on', '2022-04-29 12:15:09', '2022-04-29 12:15:09'),
(131, 13, 'registration_method', 'email', '2022-04-29 12:15:09', '2022-04-29 12:15:09'),
(132, 13, 'email_verified', '2022-04-29 13:50:27', '2022-04-29 12:50:27', '2022-04-29 12:50:27'),
(133, 13, 'email_verified_last', '2022-04-29 13:50:27', '2022-04-29 12:50:27', '2022-04-29 12:50:27'),
(134, 13, 'first_login_at', '2022-04-29 13:51:51', '2022-04-29 12:51:51', '2022-04-29 12:51:51'),
(135, 13, 'profile_phone', '693629979', '2022-04-29 12:52:50', '2022-04-29 12:52:50'),
(136, 13, 'profile_dob', '04/01/2010', '2022-04-29 12:52:50', '2022-04-29 12:52:50'),
(137, 13, 'profile_country', 'Nigeria', '2022-04-29 12:52:50', '2022-04-29 12:52:50'),
(138, 14, 'profile_display_name', 'Labaky', '2022-05-01 06:27:20', '2022-05-01 06:27:20'),
(139, 14, 'profile_avatar_bg', 'teal', '2022-05-01 06:27:20', '2022-05-01 06:27:20'),
(140, 14, 'profile_display_full_name', 'on', '2022-05-01 06:27:20', '2022-05-05 14:40:38'),
(141, 14, 'setting_activity_log', 'on', '2022-05-01 06:27:20', '2022-05-01 06:27:20'),
(142, 14, 'setting_unusual_activity', 'on', '2022-05-01 06:27:20', '2022-05-01 06:27:20'),
(143, 14, 'registration_method', 'email', '2022-05-01 06:27:20', '2022-05-01 06:27:20'),
(144, 14, 'email_verified', '2022-05-01 07:28:55', '2022-05-01 06:28:55', '2022-05-01 06:28:55'),
(145, 14, 'email_verified_last', '2022-05-01 07:28:55', '2022-05-01 06:28:55', '2022-05-01 06:28:55'),
(146, 14, 'first_login_at', '2022-05-01 07:29:11', '2022-05-01 06:29:11', '2022-05-01 06:29:11'),
(147, 14, 'profile_phone', '70132936', '2022-05-01 06:30:07', '2022-05-01 06:30:07'),
(148, 14, 'profile_dob', '07/07/2006', '2022-05-01 06:30:07', '2022-05-01 06:30:07'),
(149, 14, 'profile_country', 'Lebanon', '2022-05-01 06:30:07', '2022-05-01 06:30:07'),
(150, 15, 'profile_display_name', 'Wibaut', '2022-05-02 14:42:00', '2022-05-02 14:53:41'),
(151, 15, 'profile_avatar_bg', 'orange', '2022-05-02 14:42:00', '2022-05-02 14:42:00'),
(152, 15, 'profile_display_full_name', 'on', '2022-05-02 14:42:00', '2022-05-02 14:42:00'),
(153, 15, 'setting_activity_log', 'on', '2022-05-02 14:42:00', '2022-05-02 14:42:00'),
(154, 15, 'setting_unusual_activity', 'on', '2022-05-02 14:42:00', '2022-05-02 14:42:00'),
(155, 15, 'registration_method', 'email', '2022-05-02 14:42:00', '2022-05-02 14:42:00'),
(156, 15, 'email_verified', '2022-05-02 15:43:25', '2022-05-02 14:43:25', '2022-05-02 14:43:25'),
(157, 15, 'email_verified_last', '2022-05-02 15:43:26', '2022-05-02 14:43:26', '2022-05-02 14:43:26'),
(158, 15, 'first_login_at', '2022-05-02 15:44:04', '2022-05-02 14:44:04', '2022-05-02 14:44:04'),
(159, 15, 'profile_phone', '07776693222', '2022-05-02 14:45:10', '2022-05-02 14:45:10'),
(160, 15, 'profile_dob', '03/07/2007', '2022-05-02 14:45:10', '2022-05-02 14:45:10'),
(161, 15, 'profile_country', 'United Kingdom', '2022-05-02 14:45:10', '2022-05-02 14:45:10'),
(162, 15, 'profile_telegram', '', '2022-05-02 14:53:41', '2022-05-02 14:53:41'),
(163, 15, 'profile_gender', '', '2022-05-02 14:53:41', '2022-05-02 14:53:41'),
(164, 16, 'profile_display_name', 'Tejiri', '2022-05-02 18:36:09', '2022-05-02 18:36:09'),
(165, 16, 'profile_avatar_bg', 'indigo', '2022-05-02 18:36:09', '2022-05-02 18:36:09'),
(166, 16, 'profile_display_full_name', 'on', '2022-05-02 18:36:09', '2022-05-02 18:36:09'),
(167, 16, 'setting_activity_log', 'on', '2022-05-02 18:36:09', '2022-05-02 18:36:09'),
(168, 16, 'setting_unusual_activity', 'on', '2022-05-02 18:36:09', '2022-05-02 18:36:09'),
(169, 16, 'registration_method', 'email', '2022-05-02 18:36:09', '2022-05-02 18:36:09'),
(170, 16, 'email_verified', '2022-05-02 19:36:48', '2022-05-02 18:36:48', '2022-05-02 18:36:48'),
(171, 16, 'email_verified_last', '2022-05-02 19:36:49', '2022-05-02 18:36:49', '2022-05-02 18:36:49'),
(172, 17, 'profile_display_name', 'Meshachray', '2022-05-02 18:39:27', '2022-05-02 18:39:27'),
(173, 17, 'profile_avatar_bg', 'danger', '2022-05-02 18:39:27', '2022-05-02 18:39:27'),
(174, 17, 'profile_display_full_name', 'on', '2022-05-02 18:39:27', '2022-05-02 18:39:27'),
(175, 17, 'setting_activity_log', 'on', '2022-05-02 18:39:27', '2022-05-02 18:39:27'),
(176, 17, 'setting_unusual_activity', 'on', '2022-05-02 18:39:27', '2022-05-02 18:39:27'),
(177, 17, 'registration_method', 'email', '2022-05-02 18:39:27', '2022-05-02 18:39:27'),
(178, 17, 'email_verified', '2022-05-02 19:45:27', '2022-05-02 18:45:27', '2022-05-02 18:45:27'),
(179, 17, 'email_verified_last', '2022-05-02 19:45:28', '2022-05-02 18:45:28', '2022-05-02 18:45:28'),
(180, 17, 'first_login_at', '2022-05-02 19:45:56', '2022-05-02 18:45:56', '2022-05-02 18:45:56'),
(181, 18, 'profile_display_name', 'Rodríguez', '2022-05-03 06:52:46', '2022-05-03 06:52:46'),
(182, 18, 'profile_avatar_bg', 'success', '2022-05-03 06:52:46', '2022-05-03 06:52:46'),
(183, 18, 'profile_display_full_name', 'on', '2022-05-03 06:52:46', '2022-05-03 06:52:46'),
(184, 18, 'setting_activity_log', 'on', '2022-05-03 06:52:46', '2022-05-03 06:52:46'),
(185, 18, 'setting_unusual_activity', 'on', '2022-05-03 06:52:46', '2022-05-03 06:52:46'),
(186, 18, 'registration_method', 'email', '2022-05-03 06:52:46', '2022-05-03 06:52:46'),
(187, 18, 'email_verified', '2022-05-03 07:54:46', '2022-05-03 06:54:46', '2022-05-03 06:54:46'),
(188, 18, 'email_verified_last', '2022-05-03 07:54:46', '2022-05-03 06:54:46', '2022-05-03 06:54:46'),
(189, 14, 'profile_telegram', '', '2022-05-05 14:40:38', '2022-05-05 14:40:38'),
(190, 14, 'profile_gender', 'male', '2022-05-05 14:40:38', '2022-05-05 14:40:38'),
(191, 19, 'profile_display_name', 'Future', '2022-05-10 17:41:10', '2022-05-10 17:41:10'),
(192, 19, 'profile_avatar_bg', 'purple', '2022-05-10 17:41:10', '2022-05-10 17:41:10'),
(193, 19, 'profile_display_full_name', 'on', '2022-05-10 17:41:10', '2022-05-10 17:41:10'),
(194, 19, 'setting_activity_log', 'on', '2022-05-10 17:41:10', '2022-05-10 17:41:10'),
(195, 19, 'setting_unusual_activity', 'on', '2022-05-10 17:41:10', '2022-05-10 17:41:10'),
(196, 19, 'registration_method', 'email', '2022-05-10 17:41:10', '2022-05-10 17:41:10'),
(197, 19, 'email_verified', '2022-05-10 18:42:50', '2022-05-10 17:42:50', '2022-05-10 17:42:50'),
(198, 19, 'email_verified_last', '2022-05-10 18:42:51', '2022-05-10 17:42:51', '2022-05-10 17:42:51'),
(199, 20, 'profile_display_name', 'zuerich', '2022-05-10 17:44:46', '2022-05-10 17:44:46'),
(200, 20, 'profile_avatar_bg', 'indigo', '2022-05-10 17:44:46', '2022-05-10 17:44:46'),
(201, 20, 'profile_display_full_name', 'on', '2022-05-10 17:44:46', '2022-05-10 17:44:46'),
(202, 20, 'setting_activity_log', 'on', '2022-05-10 17:44:46', '2022-05-10 17:44:46'),
(203, 20, 'setting_unusual_activity', 'on', '2022-05-10 17:44:46', '2022-05-10 17:44:46'),
(204, 20, 'registration_method', 'email', '2022-05-10 17:44:46', '2022-05-10 17:44:46'),
(205, 20, 'email_verified', '2022-05-10 18:50:28', '2022-05-10 17:50:28', '2022-05-10 17:50:28'),
(206, 20, 'email_verified_last', '2022-05-10 18:50:28', '2022-05-10 17:50:28', '2022-05-10 17:50:28'),
(207, 20, 'first_login_at', '2022-05-10 18:50:50', '2022-05-10 17:50:50', '2022-05-10 17:50:50'),
(208, 21, 'profile_display_name', 'Gibson', '2022-05-11 17:56:19', '2022-05-11 17:56:19'),
(209, 21, 'profile_avatar_bg', 'primary', '2022-05-11 17:56:19', '2022-05-11 17:56:19'),
(210, 21, 'profile_display_full_name', 'on', '2022-05-11 17:56:19', '2022-05-11 17:56:19'),
(211, 21, 'setting_activity_log', 'on', '2022-05-11 17:56:19', '2022-05-11 17:56:19'),
(212, 21, 'setting_unusual_activity', 'on', '2022-05-11 17:56:19', '2022-05-11 17:56:19'),
(213, 21, 'registration_method', 'email', '2022-05-11 17:56:19', '2022-05-11 17:56:19'),
(214, 22, 'profile_display_name', 'MoTion', '2022-05-13 04:41:27', '2022-05-13 04:41:27'),
(215, 22, 'profile_avatar_bg', 'danger', '2022-05-13 04:41:27', '2022-05-13 04:41:27'),
(216, 22, 'profile_display_full_name', 'on', '2022-05-13 04:41:27', '2022-05-13 04:41:27'),
(217, 22, 'setting_activity_log', 'on', '2022-05-13 04:41:27', '2022-05-13 04:41:27'),
(218, 22, 'setting_unusual_activity', 'on', '2022-05-13 04:41:27', '2022-05-13 04:41:27'),
(219, 22, 'registration_method', 'email', '2022-05-13 04:41:27', '2022-05-13 04:41:27'),
(220, 22, 'email_verified', '2022-05-13 05:42:26', '2022-05-13 04:42:26', '2022-05-13 04:42:26'),
(221, 22, 'email_verified_last', '2022-05-13 05:42:26', '2022-05-13 04:42:26', '2022-05-13 04:42:26'),
(222, 22, 'first_login_at', '2022-05-13 05:42:48', '2022-05-13 04:42:48', '2022-05-13 04:42:48'),
(223, 23, 'profile_display_name', 'Cenga', '2022-05-13 10:47:58', '2022-05-13 10:55:26'),
(224, 23, 'profile_avatar_bg', 'danger', '2022-05-13 10:47:58', '2022-05-13 10:47:58'),
(225, 23, 'profile_display_full_name', 'off', '2022-05-13 10:47:58', '2022-05-13 10:55:26'),
(226, 23, 'setting_activity_log', 'on', '2022-05-13 10:47:58', '2022-05-13 10:47:58'),
(227, 23, 'setting_unusual_activity', 'on', '2022-05-13 10:47:58', '2022-05-13 10:47:58'),
(228, 23, 'registration_method', 'email', '2022-05-13 10:47:58', '2022-05-13 10:47:58'),
(229, 23, 'email_verified', '2022-05-13 11:51:35', '2022-05-13 10:51:35', '2022-05-13 10:51:35'),
(230, 23, 'email_verified_last', '2022-05-13 11:51:36', '2022-05-13 10:51:36', '2022-05-13 10:51:36'),
(231, 23, 'first_login_at', '2022-05-13 11:52:07', '2022-05-13 10:52:07', '2022-05-13 10:52:07'),
(232, 23, 'profile_phone', '+905070443407', '2022-05-13 10:53:38', '2022-05-13 10:53:38'),
(233, 23, 'profile_dob', '05/10/1974', '2022-05-13 10:53:39', '2022-05-13 10:53:39'),
(234, 23, 'profile_country', 'Turkey', '2022-05-13 10:53:39', '2022-05-13 10:53:39'),
(235, 23, 'profile_telegram', '', '2022-05-13 10:55:26', '2022-05-13 10:55:26'),
(236, 23, 'profile_gender', 'male', '2022-05-13 10:55:26', '2022-05-13 10:55:26'),
(237, 24, 'profile_display_name', 'Baiushta', '2022-05-18 17:09:13', '2022-05-18 17:09:13'),
(238, 24, 'profile_avatar_bg', 'purple', '2022-05-18 17:09:13', '2022-05-18 17:09:13'),
(239, 24, 'profile_display_full_name', 'on', '2022-05-18 17:09:13', '2022-05-18 17:09:13'),
(240, 24, 'setting_activity_log', 'on', '2022-05-18 17:09:13', '2022-05-18 17:09:13'),
(241, 24, 'setting_unusual_activity', 'on', '2022-05-18 17:09:13', '2022-05-18 17:09:13'),
(242, 24, 'registration_method', 'email', '2022-05-18 17:09:13', '2022-05-18 17:09:13'),
(243, 24, 'email_verified', '2022-05-18 18:37:24', '2022-05-18 17:37:24', '2022-05-18 17:37:24'),
(244, 24, 'email_verified_last', '2022-05-18 18:37:32', '2022-05-18 17:37:25', '2022-05-18 17:37:32'),
(245, 24, 'first_login_at', '2022-05-18 18:38:20', '2022-05-18 17:38:20', '2022-05-18 17:38:20'),
(246, 25, 'profile_display_name', 'Romesh', '2022-05-19 06:04:58', '2022-05-19 06:04:58'),
(247, 25, 'profile_avatar_bg', 'gray', '2022-05-19 06:04:58', '2022-05-19 06:04:58'),
(248, 25, 'profile_display_full_name', 'on', '2022-05-19 06:04:58', '2022-05-19 06:04:58'),
(249, 25, 'setting_activity_log', 'on', '2022-05-19 06:04:58', '2022-05-19 06:04:58'),
(250, 25, 'setting_unusual_activity', 'on', '2022-05-19 06:04:58', '2022-05-19 06:04:58'),
(251, 25, 'registration_method', 'email', '2022-05-19 06:04:58', '2022-05-19 06:04:58'),
(252, 25, 'email_verified', '2022-05-19 07:07:21', '2022-05-19 06:07:21', '2022-05-19 06:07:21'),
(253, 25, 'email_verified_last', '2022-05-19 07:07:24', '2022-05-19 06:07:24', '2022-05-19 06:07:24'),
(254, 25, 'first_login_at', '2022-05-19 07:07:47', '2022-05-19 06:07:47', '2022-05-19 06:07:47'),
(255, 25, 'profile_phone', '89530705133', '2022-05-19 06:11:43', '2022-05-19 06:11:43'),
(256, 25, 'profile_dob', '08/06/1990', '2022-05-19 06:11:43', '2022-05-19 06:11:43'),
(257, 25, 'profile_country', 'Russian Federation', '2022-05-19 06:11:43', '2022-05-19 06:11:43'),
(258, 26, 'profile_display_name', 'Martinez', '2022-05-20 15:55:04', '2022-05-20 15:55:04'),
(259, 26, 'profile_avatar_bg', 'secondary', '2022-05-20 15:55:04', '2022-05-20 15:55:04'),
(260, 26, 'profile_display_full_name', 'on', '2022-05-20 15:55:04', '2022-05-20 15:55:04'),
(261, 26, 'setting_activity_log', 'on', '2022-05-20 15:55:04', '2022-05-20 15:55:04'),
(262, 26, 'setting_unusual_activity', 'on', '2022-05-20 15:55:04', '2022-05-20 15:55:04'),
(263, 26, 'registration_method', 'email', '2022-05-20 15:55:04', '2022-05-20 15:55:04'),
(264, 26, 'email_verified', '2022-05-20 16:56:09', '2022-05-20 15:56:09', '2022-05-20 15:56:09'),
(265, 26, 'email_verified_last', '2022-05-20 16:56:09', '2022-05-20 15:56:09', '2022-05-20 15:56:09'),
(266, 26, 'first_login_at', '2022-05-20 16:56:30', '2022-05-20 15:56:30', '2022-05-20 15:56:30'),
(267, 26, 'profile_phone', '7868187464', '2022-05-20 15:58:27', '2022-05-20 15:58:27'),
(268, 26, 'profile_dob', '08/27/1975', '2022-05-20 15:58:27', '2022-05-20 15:58:27'),
(269, 26, 'profile_country', 'United States', '2022-05-20 15:58:27', '2022-05-20 15:58:27'),
(270, 27, 'profile_display_name', 'Vivek', '2022-05-22 11:23:16', '2022-05-22 11:26:25'),
(271, 27, 'profile_avatar_bg', 'azure', '2022-05-22 11:23:16', '2022-05-22 11:23:16'),
(272, 27, 'profile_display_full_name', 'on', '2022-05-22 11:23:16', '2022-05-22 11:23:16'),
(273, 27, 'setting_activity_log', 'on', '2022-05-22 11:23:16', '2022-05-22 11:23:16'),
(274, 27, 'setting_unusual_activity', 'on', '2022-05-22 11:23:16', '2022-05-22 11:23:16'),
(275, 27, 'registration_method', 'email', '2022-05-22 11:23:16', '2022-05-22 11:23:16'),
(276, 27, 'email_verified', '2022-05-22 12:24:27', '2022-05-22 11:24:27', '2022-05-22 11:24:27'),
(277, 27, 'email_verified_last', '2022-05-22 12:24:28', '2022-05-22 11:24:28', '2022-05-22 11:24:28'),
(278, 27, 'first_login_at', '2022-05-22 12:25:05', '2022-05-22 11:25:05', '2022-05-22 11:25:05'),
(279, 27, 'profile_phone', '9563812222', '2022-05-22 11:26:25', '2022-05-22 11:26:25'),
(280, 27, 'profile_dob', '06/19/2002', '2022-05-22 11:26:25', '2022-05-22 11:26:25'),
(281, 27, 'profile_country', 'India', '2022-05-22 11:26:25', '2022-05-22 11:26:25'),
(282, 28, 'profile_display_name', 'palit', '2022-05-22 12:23:35', '2022-05-22 12:23:35'),
(283, 28, 'profile_avatar_bg', 'blue', '2022-05-22 12:23:35', '2022-05-22 12:23:35'),
(284, 28, 'profile_display_full_name', 'off', '2022-05-22 12:23:35', '2022-05-22 12:27:48'),
(285, 28, 'setting_activity_log', 'on', '2022-05-22 12:23:35', '2022-05-22 12:23:35'),
(286, 28, 'setting_unusual_activity', 'on', '2022-05-22 12:23:35', '2022-05-22 12:23:35'),
(287, 28, 'registration_method', 'email', '2022-05-22 12:23:35', '2022-05-22 12:23:35'),
(288, 28, 'email_verified', '2022-05-22 13:25:14', '2022-05-22 12:25:14', '2022-05-22 12:25:14'),
(289, 28, 'email_verified_last', '2022-05-22 13:25:15', '2022-05-22 12:25:15', '2022-05-22 12:25:15'),
(290, 28, 'first_login_at', '2022-05-22 13:26:08', '2022-05-22 12:26:08', '2022-05-22 12:26:08'),
(291, 28, 'profile_phone', '01861709407', '2022-05-22 12:27:48', '2022-05-22 12:27:48'),
(292, 28, 'profile_dob', '12/26/2003', '2022-05-22 12:27:48', '2022-05-22 12:27:48'),
(293, 28, 'profile_country', 'Bangladesh', '2022-05-22 12:27:48', '2022-05-22 12:27:48'),
(294, 29, 'profile_display_name', 'Olleotti', '2022-05-22 18:57:30', '2022-05-22 18:57:30'),
(295, 29, 'profile_avatar_bg', 'secondary', '2022-05-22 18:57:30', '2022-05-22 18:57:30'),
(296, 29, 'profile_display_full_name', 'on', '2022-05-22 18:57:30', '2022-05-22 18:57:30'),
(297, 29, 'setting_activity_log', 'on', '2022-05-22 18:57:30', '2022-05-22 18:57:30'),
(298, 29, 'setting_unusual_activity', 'on', '2022-05-22 18:57:30', '2022-05-22 18:57:30'),
(299, 29, 'registration_method', 'email', '2022-05-22 18:57:30', '2022-05-22 18:57:30'),
(300, 29, 'email_verified', '2022-05-22 20:01:43', '2022-05-22 19:01:43', '2022-05-22 19:01:43'),
(301, 29, 'email_verified_last', '2022-05-22 20:01:46', '2022-05-22 19:01:44', '2022-05-22 19:01:46'),
(302, 29, 'first_login_at', '2022-05-22 20:17:44', '2022-05-22 19:17:44', '2022-05-22 19:17:44'),
(303, 30, 'profile_display_name', 'Butėnaitė', '2022-06-09 02:15:11', '2022-06-09 02:15:11'),
(304, 30, 'profile_avatar_bg', 'orange', '2022-06-09 02:15:11', '2022-06-09 02:15:11'),
(305, 30, 'profile_display_full_name', 'on', '2022-06-09 02:15:11', '2022-06-09 02:15:11'),
(306, 30, 'setting_activity_log', 'on', '2022-06-09 02:15:11', '2022-06-09 02:15:11'),
(307, 30, 'setting_unusual_activity', 'on', '2022-06-09 02:15:11', '2022-06-09 02:15:11'),
(308, 30, 'registration_method', 'email', '2022-06-09 02:15:11', '2022-06-09 02:15:11'),
(309, 30, 'email_verified', '2022-06-09 03:16:15', '2022-06-09 02:16:15', '2022-06-09 02:16:15'),
(310, 30, 'email_verified_last', '2022-06-09 03:16:16', '2022-06-09 02:16:16', '2022-06-09 02:16:16'),
(311, 30, 'first_login_at', '2022-06-09 03:16:56', '2022-06-09 02:16:56', '2022-06-09 02:16:56'),
(312, 7, 'profile_address_line_1', '4 Brigade HVO', '2022-06-09 12:15:04', '2022-06-09 12:15:04'),
(313, 7, 'profile_address_line_2', 'Stjepana Radica 39', '2022-06-09 12:15:04', '2022-06-09 12:15:04'),
(314, 7, 'profile_city', 'Ljubuški', '2022-06-09 12:15:04', '2022-06-09 12:15:04'),
(315, 7, 'profile_state', 'Ljubuski', '2022-06-09 12:15:04', '2022-06-09 12:15:04'),
(316, 7, 'profile_zip', '88320', '2022-06-09 12:15:04', '2022-06-09 12:15:04'),
(317, 7, 'profile_country', 'Bosnia and Herzegovina', '2022-06-09 12:15:04', '2022-06-09 12:15:04'),
(318, 7, 'profile_nationality', 'Croatia', '2022-06-09 12:15:04', '2022-06-09 12:15:04'),
(319, 31, 'profile_display_name', 'Akmehmet', '2022-06-10 21:48:00', '2022-06-10 21:48:00'),
(320, 31, 'profile_avatar_bg', 'purple', '2022-06-10 21:48:00', '2022-06-10 21:48:00'),
(321, 31, 'profile_display_full_name', 'on', '2022-06-10 21:48:00', '2022-06-10 21:48:00'),
(322, 31, 'setting_activity_log', 'on', '2022-06-10 21:48:00', '2022-06-10 21:48:00'),
(323, 31, 'setting_unusual_activity', 'on', '2022-06-10 21:48:00', '2022-06-10 21:48:00'),
(324, 31, 'registration_method', 'email', '2022-06-10 21:48:00', '2022-06-10 21:48:00'),
(325, 31, 'email_verified', '2022-06-10 22:49:22', '2022-06-10 21:49:22', '2022-06-10 21:49:22'),
(326, 31, 'email_verified_last', '2022-06-10 22:49:23', '2022-06-10 21:49:23', '2022-06-10 21:49:23'),
(327, 31, 'first_login_at', '2022-06-10 22:50:39', '2022-06-10 21:50:39', '2022-06-10 21:50:39'),
(328, 31, 'profile_phone', '+90 5393058287', '2022-06-10 21:52:03', '2022-06-10 21:52:03'),
(329, 31, 'profile_dob', '12/11/2000', '2022-06-10 21:52:03', '2022-06-10 21:52:03'),
(330, 31, 'profile_country', 'Turkey', '2022-06-10 21:52:03', '2022-06-10 21:52:03'),
(331, 32, 'profile_display_name', 'James', '2022-06-12 15:12:52', '2022-06-12 15:12:52'),
(332, 32, 'profile_avatar_bg', 'purple', '2022-06-12 15:12:52', '2022-06-12 15:12:52'),
(333, 32, 'profile_display_full_name', 'on', '2022-06-12 15:12:52', '2022-06-12 15:12:52'),
(334, 32, 'setting_activity_log', 'on', '2022-06-12 15:12:52', '2022-06-12 15:12:52'),
(335, 32, 'setting_unusual_activity', 'on', '2022-06-12 15:12:52', '2022-06-12 15:12:52'),
(336, 32, 'registration_method', 'email', '2022-06-12 15:12:52', '2022-06-12 15:12:52'),
(337, 32, 'email_verified', '2022-06-12 16:13:40', '2022-06-12 15:13:40', '2022-06-12 15:13:40'),
(338, 32, 'email_verified_last', '2022-06-12 16:13:40', '2022-06-12 15:13:40', '2022-06-12 15:13:40'),
(339, 32, 'first_login_at', '2022-06-12 16:13:53', '2022-06-12 15:13:53', '2022-06-12 15:13:53'),
(340, 32, 'profile_phone', '09023604806', '2022-06-12 15:15:33', '2022-06-12 15:15:33'),
(341, 32, 'profile_dob', '11/13/1988', '2022-06-12 15:15:33', '2022-06-12 15:15:33'),
(342, 32, 'profile_country', 'Nigeria', '2022-06-12 15:15:33', '2022-06-12 15:15:33'),
(343, 33, 'profile_display_name', 'tsai', '2022-06-12 20:12:02', '2022-06-12 20:12:02'),
(344, 33, 'profile_avatar_bg', 'orange', '2022-06-12 20:12:02', '2022-06-12 20:12:02'),
(345, 33, 'profile_display_full_name', 'on', '2022-06-12 20:12:02', '2022-06-12 20:12:02'),
(346, 33, 'setting_activity_log', 'on', '2022-06-12 20:12:02', '2022-06-12 20:12:02'),
(347, 33, 'setting_unusual_activity', 'on', '2022-06-12 20:12:02', '2022-06-12 20:12:02'),
(348, 33, 'registration_method', 'email', '2022-06-12 20:12:02', '2022-06-12 20:12:02'),
(349, 35, 'profile_display_name', 'tsai', '2022-06-12 20:13:12', '2022-06-12 20:13:12'),
(350, 35, 'profile_avatar_bg', 'danger', '2022-06-12 20:13:12', '2022-06-12 20:13:12'),
(351, 35, 'profile_display_full_name', 'on', '2022-06-12 20:13:12', '2022-06-12 20:13:12'),
(352, 35, 'setting_activity_log', 'on', '2022-06-12 20:13:12', '2022-06-12 20:13:12'),
(353, 35, 'setting_unusual_activity', 'on', '2022-06-12 20:13:12', '2022-06-12 20:13:12'),
(354, 35, 'registration_method', 'email', '2022-06-12 20:13:12', '2022-06-12 20:13:12'),
(355, 35, 'last_password_changed', '1655068846', '2022-06-12 20:20:46', '2022-06-12 20:20:46'),
(356, 36, 'profile_display_name', 'Deividas', '2022-06-13 21:03:49', '2022-06-13 21:03:49'),
(357, 36, 'profile_avatar_bg', 'indigo', '2022-06-13 21:03:49', '2022-06-13 21:03:49'),
(358, 36, 'profile_display_full_name', 'on', '2022-06-13 21:03:49', '2022-06-13 21:03:49'),
(359, 36, 'setting_activity_log', 'on', '2022-06-13 21:03:49', '2022-06-13 21:03:49'),
(360, 36, 'setting_unusual_activity', 'on', '2022-06-13 21:03:49', '2022-06-13 21:03:49'),
(361, 36, 'registration_method', 'email', '2022-06-13 21:03:49', '2022-06-13 21:03:49'),
(362, 36, 'email_verified', '2022-06-13 22:04:34', '2022-06-13 21:04:34', '2022-06-13 21:04:34'),
(363, 36, 'email_verified_last', '2022-06-13 22:04:34', '2022-06-13 21:04:34', '2022-06-13 21:04:34'),
(364, 36, 'last_password_changed', '1655158041', '2022-06-13 21:07:21', '2022-06-13 21:07:21'),
(365, 36, 'first_login_at', '2022-06-13 22:07:38', '2022-06-13 21:07:38', '2022-06-13 21:07:38'),
(366, 36, 'profile_phone', '+37063617503', '2022-06-13 21:08:41', '2022-06-13 21:08:41'),
(367, 36, 'profile_dob', '09/04/1997', '2022-06-13 21:08:41', '2022-06-13 21:08:41'),
(368, 36, 'profile_country', 'Lithuania', '2022-06-13 21:08:41', '2022-06-13 21:08:41'),
(369, 11, 'last_password_changed', '1655338034', '2022-06-15 23:07:14', '2022-06-15 23:07:14'),
(370, 37, 'profile_display_name', 'joseph', '2022-06-17 17:25:50', '2022-06-17 17:25:50'),
(371, 37, 'profile_avatar_bg', 'indigo', '2022-06-17 17:25:50', '2022-06-17 17:25:50'),
(372, 37, 'profile_display_full_name', 'on', '2022-06-17 17:25:50', '2022-06-17 17:25:50'),
(373, 37, 'setting_activity_log', 'on', '2022-06-17 17:25:50', '2022-06-17 17:25:50'),
(374, 37, 'setting_unusual_activity', 'on', '2022-06-17 17:25:50', '2022-06-17 17:25:50'),
(375, 37, 'registration_method', 'email', '2022-06-17 17:25:50', '2022-06-17 17:25:50'),
(376, 37, 'email_verified', '2022-06-17 18:28:00', '2022-06-17 17:28:00', '2022-06-17 17:28:00'),
(377, 37, 'email_verified_last', '2022-06-17 18:28:00', '2022-06-17 17:28:00', '2022-06-17 17:28:00'),
(378, 37, 'first_login_at', '2022-06-17 18:28:21', '2022-06-17 17:28:21', '2022-06-17 17:28:21'),
(379, 37, 'profile_phone', '3477598739', '2022-06-17 17:34:26', '2022-06-17 17:34:26'),
(380, 37, 'profile_dob', '01/09/2000', '2022-06-17 17:34:26', '2022-06-17 17:34:26'),
(381, 37, 'profile_telegram', '', '2022-06-17 17:34:26', '2022-06-17 17:34:26'),
(382, 37, 'profile_gender', 'male', '2022-06-17 17:34:26', '2022-06-17 17:34:26'),
(383, 37, 'profile_address_line_1', '5804 penn street', '2022-06-17 17:35:52', '2022-06-17 17:35:52'),
(384, 37, 'profile_address_line_2', '', '2022-06-17 17:35:52', '2022-06-17 17:35:52'),
(385, 37, 'profile_city', 'Philadelphia', '2022-06-17 17:35:52', '2022-06-17 17:35:52'),
(386, 37, 'profile_state', 'Pennsylvania', '2022-06-17 17:35:52', '2022-06-17 17:35:52'),
(387, 37, 'profile_zip', '19149', '2022-06-17 17:35:52', '2022-06-17 17:35:52'),
(388, 37, 'profile_country', 'United States', '2022-06-17 17:35:52', '2022-06-17 17:35:52'),
(389, 37, 'profile_nationality', 'Haiti', '2022-06-17 17:35:52', '2022-07-09 19:14:25'),
(390, 2, 'last_password_changed', '1656357640', '2022-06-27 18:20:40', '2022-06-27 18:20:40'),
(391, 38, 'profile_display_name', 'Langi', '2022-07-06 06:00:34', '2022-07-06 06:00:34'),
(392, 38, 'profile_avatar_bg', 'primary', '2022-07-06 06:00:34', '2022-07-06 06:00:34'),
(393, 38, 'profile_display_full_name', 'on', '2022-07-06 06:00:34', '2022-07-06 06:00:34'),
(394, 38, 'setting_activity_log', 'on', '2022-07-06 06:00:34', '2022-07-06 06:00:34'),
(395, 38, 'setting_unusual_activity', 'on', '2022-07-06 06:00:34', '2022-07-06 06:00:34'),
(396, 38, 'registration_method', 'email', '2022-07-06 06:00:34', '2022-07-06 06:00:34'),
(397, 39, 'profile_display_name', 'Langi', '2022-07-06 06:01:08', '2022-07-06 06:01:08'),
(398, 39, 'profile_avatar_bg', 'azure', '2022-07-06 06:01:08', '2022-07-06 06:01:08'),
(399, 39, 'profile_display_full_name', 'on', '2022-07-06 06:01:08', '2022-07-06 06:01:08'),
(400, 39, 'setting_activity_log', 'on', '2022-07-06 06:01:08', '2022-07-06 06:01:08'),
(401, 39, 'setting_unusual_activity', 'on', '2022-07-06 06:01:08', '2022-07-06 06:01:08'),
(402, 39, 'registration_method', 'email', '2022-07-06 06:01:08', '2022-07-06 06:01:08'),
(403, 40, 'profile_display_name', 'Langi', '2022-07-06 06:03:08', '2022-07-06 06:03:08'),
(404, 40, 'profile_avatar_bg', 'pink', '2022-07-06 06:03:08', '2022-07-06 06:03:08'),
(405, 40, 'profile_display_full_name', 'on', '2022-07-06 06:03:08', '2022-07-06 06:03:08'),
(406, 40, 'setting_activity_log', 'on', '2022-07-06 06:03:08', '2022-07-06 06:03:08'),
(407, 40, 'setting_unusual_activity', 'on', '2022-07-06 06:03:08', '2022-07-06 06:03:08'),
(408, 40, 'registration_method', 'email', '2022-07-06 06:03:08', '2022-07-06 06:03:08'),
(409, 40, 'email_verified', '2022-07-06 07:03:34', '2022-07-06 06:03:34', '2022-07-06 06:03:34'),
(410, 40, 'email_verified_last', '2022-07-06 07:03:35', '2022-07-06 06:03:35', '2022-07-06 06:03:35'),
(411, 40, 'first_login_at', '2022-07-06 07:04:08', '2022-07-06 06:04:08', '2022-07-06 06:04:08'),
(412, 40, 'profile_phone', '0435784470', '2022-07-06 06:05:00', '2022-07-06 06:05:00'),
(413, 40, 'profile_dob', '04/22/2006', '2022-07-06 06:05:00', '2022-07-06 06:05:00'),
(414, 40, 'profile_country', 'Australia', '2022-07-06 06:05:00', '2022-07-06 06:05:00'),
(415, 41, 'profile_display_name', 'Rigby', '2022-07-11 16:17:31', '2022-07-11 16:17:31'),
(416, 41, 'profile_avatar_bg', 'purple', '2022-07-11 16:17:31', '2022-07-11 16:17:31'),
(417, 41, 'profile_display_full_name', 'on', '2022-07-11 16:17:31', '2022-07-11 16:17:31'),
(418, 41, 'setting_activity_log', 'on', '2022-07-11 16:17:31', '2022-07-11 16:17:31'),
(419, 41, 'setting_unusual_activity', 'on', '2022-07-11 16:17:31', '2022-07-11 16:17:31'),
(420, 41, 'registration_method', 'email', '2022-07-11 16:17:31', '2022-07-11 16:17:31'),
(421, 41, 'email_verified', '2022-07-11 17:18:13', '2022-07-11 16:18:13', '2022-07-11 16:18:13'),
(422, 41, 'email_verified_last', '2022-07-11 17:18:13', '2022-07-11 16:18:13', '2022-07-11 16:18:13'),
(423, 41, 'first_login_at', '2022-07-11 17:18:28', '2022-07-11 16:18:28', '2022-07-11 16:18:28'),
(424, 41, 'profile_phone', '2085402162', '2022-07-11 16:20:25', '2022-07-11 16:20:25'),
(425, 41, 'profile_dob', '09/23/1995', '2022-07-11 16:20:25', '2022-07-11 16:20:25'),
(426, 41, 'profile_country', 'United States', '2022-07-11 16:20:25', '2022-07-11 16:20:25'),
(427, 37, 'tnx_display', 'compact', '2022-07-18 19:08:04', '2022-07-18 19:08:04'),
(428, 42, 'profile_display_name', 'Tamwera', '2022-07-24 21:33:20', '2022-07-24 21:33:20'),
(429, 42, 'profile_avatar_bg', 'indigo', '2022-07-24 21:33:20', '2022-07-24 21:33:20'),
(430, 42, 'profile_display_full_name', 'on', '2022-07-24 21:33:20', '2022-07-24 21:33:20'),
(431, 42, 'setting_activity_log', 'on', '2022-07-24 21:33:20', '2022-07-24 21:33:20'),
(432, 42, 'setting_unusual_activity', 'on', '2022-07-24 21:33:20', '2022-07-24 21:33:20'),
(433, 42, 'registration_method', 'email', '2022-07-24 21:33:20', '2022-07-24 21:33:20'),
(434, 42, 'email_verified', '2022-07-24 22:34:50', '2022-07-24 21:34:50', '2022-07-24 21:34:50'),
(435, 42, 'email_verified_last', '2022-07-24 22:34:50', '2022-07-24 21:34:50', '2022-07-24 21:34:50'),
(436, 42, 'first_login_at', '2022-07-24 22:35:38', '2022-07-24 21:35:38', '2022-07-24 21:35:38'),
(437, 42, 'profile_phone', '73050692', '2022-07-24 21:37:07', '2022-07-24 21:37:07'),
(438, 42, 'profile_dob', '10/02/1982', '2022-07-24 21:37:07', '2022-07-24 21:37:07'),
(439, 42, 'profile_country', 'Kiribati', '2022-07-24 21:37:07', '2022-07-24 21:37:07'),
(440, 42, 'profile_telegram', '', '2022-07-24 21:40:05', '2022-07-24 21:40:05'),
(441, 42, 'profile_gender', 'male', '2022-07-24 21:40:05', '2022-07-24 21:40:05'),
(442, 42, 'profile_address_line_1', 'Opposite Taotin electronic', '2022-07-24 21:41:10', '2022-07-24 21:41:10'),
(443, 42, 'profile_address_line_2', 'Tetabuki Betio', '2022-07-24 21:41:10', '2022-07-24 21:41:10'),
(444, 42, 'profile_city', 'Tetabuki Betio', '2022-07-24 21:41:10', '2022-07-24 21:41:10'),
(445, 42, 'profile_state', 'Tarawa', '2022-07-24 21:41:10', '2022-07-24 21:41:10'),
(446, 42, 'profile_zip', 'N/A', '2022-07-24 21:41:10', '2022-07-24 21:41:10'),
(447, 42, 'profile_nationality', 'same', '2022-07-24 21:41:10', '2022-07-24 21:41:10'),
(448, 43, 'profile_display_name', 'Lilly', '2022-07-25 01:02:25', '2022-07-25 01:02:25'),
(449, 43, 'profile_avatar_bg', 'orange', '2022-07-25 01:02:25', '2022-07-25 01:02:25'),
(450, 43, 'profile_display_full_name', 'on', '2022-07-25 01:02:25', '2022-07-25 01:02:25'),
(451, 43, 'setting_activity_log', 'on', '2022-07-25 01:02:25', '2022-07-25 01:02:25'),
(452, 43, 'setting_unusual_activity', 'on', '2022-07-25 01:02:25', '2022-07-25 01:02:25'),
(453, 43, 'registration_method', 'email', '2022-07-25 01:02:25', '2022-07-25 01:02:25'),
(454, 45, 'profile_display_name', 'Teetu', '2022-07-25 11:21:58', '2022-07-25 11:21:58'),
(455, 45, 'profile_avatar_bg', 'gray', '2022-07-25 11:21:58', '2022-07-25 11:21:58'),
(456, 45, 'profile_display_full_name', 'on', '2022-07-25 11:21:58', '2022-07-25 11:21:58'),
(457, 45, 'setting_activity_log', 'on', '2022-07-25 11:21:58', '2022-07-25 11:21:58'),
(458, 45, 'setting_unusual_activity', 'on', '2022-07-25 11:21:58', '2022-07-25 11:21:58'),
(459, 45, 'registration_method', 'email', '2022-07-25 11:21:58', '2022-07-25 11:21:58'),
(460, 46, 'profile_display_name', 'Teetu', '2022-07-25 11:57:17', '2022-07-25 11:57:17'),
(461, 46, 'profile_avatar_bg', 'azure', '2022-07-25 11:57:17', '2022-07-25 11:57:17'),
(462, 46, 'profile_display_full_name', 'on', '2022-07-25 11:57:17', '2022-07-25 11:57:17'),
(463, 46, 'setting_activity_log', 'on', '2022-07-25 11:57:17', '2022-07-25 11:57:17'),
(464, 46, 'setting_unusual_activity', 'on', '2022-07-25 11:57:17', '2022-07-25 11:57:17'),
(465, 46, 'registration_method', 'email', '2022-07-25 11:57:17', '2022-07-25 11:57:17'),
(466, 47, 'profile_display_name', 'Retibita', '2022-07-28 13:53:05', '2022-07-28 13:53:05'),
(467, 47, 'profile_avatar_bg', 'warning', '2022-07-28 13:53:05', '2022-07-28 13:53:05'),
(468, 47, 'profile_display_full_name', 'on', '2022-07-28 13:53:05', '2022-07-28 13:53:05'),
(469, 47, 'setting_activity_log', 'on', '2022-07-28 13:53:05', '2022-07-28 13:53:05'),
(470, 47, 'setting_unusual_activity', 'on', '2022-07-28 13:53:05', '2022-07-28 13:53:05'),
(471, 47, 'registration_method', 'email', '2022-07-28 13:53:05', '2022-07-28 13:53:05'),
(472, 48, 'profile_display_name', 'tabekia', '2022-07-29 06:33:01', '2022-07-29 06:33:01'),
(473, 48, 'profile_avatar_bg', 'warning', '2022-07-29 06:33:01', '2022-07-29 06:33:01'),
(474, 48, 'profile_display_full_name', 'on', '2022-07-29 06:33:01', '2022-07-29 06:33:01'),
(475, 48, 'setting_activity_log', 'on', '2022-07-29 06:33:01', '2022-07-29 06:33:01'),
(476, 48, 'setting_unusual_activity', 'on', '2022-07-29 06:33:01', '2022-07-29 06:33:01'),
(477, 48, 'registration_method', 'email', '2022-07-29 06:33:01', '2022-07-29 06:33:01'),
(478, 47, 'email_verified', '2022-07-29 07:33:47', '2022-07-29 06:33:47', '2022-07-29 06:33:47'),
(479, 47, 'email_verified_last', '2022-07-29 07:33:48', '2022-07-29 06:33:48', '2022-07-29 06:33:48'),
(480, 47, 'first_login_at', '2022-07-29 07:37:06', '2022-07-29 06:37:06', '2022-07-29 06:37:06'),
(481, 47, 'profile_phone', '0484 530056', '2022-07-29 06:40:26', '2022-07-29 06:40:26'),
(482, 47, 'profile_dob', '09/29/1996', '2022-07-29 06:40:26', '2022-07-29 06:40:26'),
(483, 47, 'profile_country', 'Kiribati', '2022-07-29 06:40:26', '2022-07-29 06:40:26'),
(484, 49, 'profile_display_name', 'Diamond', '2022-08-04 19:12:11', '2022-08-04 19:12:11'),
(485, 49, 'profile_avatar_bg', 'purple', '2022-08-04 19:12:11', '2022-08-04 19:12:11'),
(486, 49, 'profile_display_full_name', 'on', '2022-08-04 19:12:11', '2022-08-04 19:12:11'),
(487, 49, 'setting_activity_log', 'on', '2022-08-04 19:12:11', '2022-08-04 19:12:11'),
(488, 49, 'setting_unusual_activity', 'on', '2022-08-04 19:12:11', '2022-08-04 19:12:11'),
(489, 49, 'registration_method', 'email', '2022-08-04 19:12:11', '2022-08-04 19:12:11'),
(490, 49, 'email_verified', '2022-08-04 20:12:53', '2022-08-04 19:12:53', '2022-08-04 19:12:53'),
(491, 49, 'email_verified_last', '2022-08-04 20:12:53', '2022-08-04 19:12:53', '2022-08-04 19:12:53'),
(492, 49, 'first_login_at', '2022-08-04 20:14:34', '2022-08-04 19:14:34', '2022-08-04 19:14:34'),
(493, 50, 'profile_display_name', 'Ignacio Condeminas', '2022-08-14 10:46:05', '2022-08-14 10:48:58'),
(494, 50, 'profile_avatar_bg', 'pink', '2022-08-14 10:46:05', '2022-08-14 10:46:05'),
(495, 50, 'profile_display_full_name', 'on', '2022-08-14 10:46:05', '2022-08-14 10:46:05'),
(496, 50, 'setting_activity_log', 'on', '2022-08-14 10:46:05', '2022-08-14 10:46:05'),
(497, 50, 'setting_unusual_activity', 'on', '2022-08-14 10:46:05', '2022-08-14 10:46:05'),
(498, 50, 'registration_method', 'email', '2022-08-14 10:46:05', '2022-08-14 10:46:05'),
(499, 50, 'email_verified', '2022-08-14 11:46:48', '2022-08-14 10:46:48', '2022-08-14 10:46:48'),
(500, 50, 'email_verified_last', '2022-08-14 11:46:49', '2022-08-14 10:46:49', '2022-08-14 10:46:49'),
(501, 50, 'first_login_at', '2022-08-14 11:47:02', '2022-08-14 10:47:02', '2022-08-14 10:47:02'),
(502, 50, 'profile_phone', '657389405', '2022-08-14 10:48:58', '2022-08-14 10:48:58'),
(503, 50, 'profile_dob', '05/23/1963', '2022-08-14 10:48:58', '2022-08-23 14:37:43'),
(504, 50, 'profile_country', 'Spain', '2022-08-14 10:48:58', '2022-08-14 10:48:58'),
(505, 51, 'profile_display_name', 'Meredithsills', '2022-08-15 01:16:13', '2022-08-15 01:16:13'),
(506, 51, 'profile_avatar_bg', 'secondary', '2022-08-15 01:16:13', '2022-08-15 01:16:13'),
(507, 51, 'profile_display_full_name', 'on', '2022-08-15 01:16:13', '2022-08-15 01:16:13'),
(508, 51, 'setting_activity_log', 'on', '2022-08-15 01:16:13', '2022-08-15 01:16:13'),
(509, 51, 'setting_unusual_activity', 'on', '2022-08-15 01:16:13', '2022-08-15 01:16:13'),
(510, 51, 'registration_method', 'email', '2022-08-15 01:16:13', '2022-08-15 01:16:13'),
(511, 50, 'profile_address_line_1', 'Narcís Monturiol,59', '2022-08-23 12:45:57', '2022-08-23 12:45:57'),
(512, 50, 'profile_address_line_2', '', '2022-08-23 12:45:57', '2022-08-23 12:45:57'),
(513, 50, 'profile_city', 'Vilassar De Mar', '2022-08-23 12:45:57', '2022-08-23 12:45:57'),
(514, 50, 'profile_state', 'Barcelona', '2022-08-23 12:45:57', '2022-08-23 12:45:57'),
(515, 50, 'profile_zip', '08340', '2022-08-23 12:45:57', '2022-08-23 12:45:57'),
(516, 50, 'profile_nationality', 'same', '2022-08-23 12:45:57', '2022-08-23 12:45:57'),
(517, 50, 'profile_telegram', '@Ignasi_Condeminas', '2022-08-23 14:36:28', '2022-09-01 14:46:50'),
(518, 50, 'profile_gender', 'male', '2022-08-23 14:36:28', '2022-09-01 14:46:50'),
(519, 52, 'profile_display_name', 'Bernice', '2022-09-16 21:50:28', '2022-09-16 21:50:28'),
(520, 52, 'profile_avatar_bg', 'primary', '2022-09-16 21:50:28', '2022-09-16 21:50:28'),
(521, 52, 'profile_display_full_name', 'on', '2022-09-16 21:50:28', '2022-09-16 21:50:28'),
(522, 52, 'setting_activity_log', 'on', '2022-09-16 21:50:28', '2022-09-16 21:50:28'),
(523, 52, 'setting_unusual_activity', 'on', '2022-09-16 21:50:28', '2022-09-16 21:50:28'),
(524, 52, 'registration_method', 'email', '2022-09-16 21:50:28', '2022-09-16 21:50:28'),
(525, 53, 'profile_display_name', 'Bernice', '2022-09-17 11:15:20', '2022-09-17 11:15:20'),
(526, 53, 'profile_avatar_bg', 'gray', '2022-09-17 11:15:20', '2022-09-17 11:15:20'),
(527, 53, 'profile_display_full_name', 'on', '2022-09-17 11:15:20', '2022-09-17 11:15:20'),
(528, 53, 'setting_activity_log', 'on', '2022-09-17 11:15:20', '2022-09-17 11:15:20'),
(529, 53, 'setting_unusual_activity', 'on', '2022-09-17 11:15:20', '2022-09-17 11:15:20'),
(530, 53, 'registration_method', 'email', '2022-09-17 11:15:20', '2022-09-17 11:15:20'),
(531, 53, 'first_login_at', '2022-09-17 11:16:04', '2022-09-17 11:16:04', '2022-09-17 11:16:04'),
(532, 54, 'profile_display_name', 'Perry', '2022-09-17 12:27:16', '2022-09-17 12:27:16'),
(533, 54, 'profile_avatar_bg', 'primary', '2022-09-17 12:27:16', '2022-09-17 12:27:16'),
(534, 54, 'profile_display_full_name', 'on', '2022-09-17 12:27:16', '2022-09-17 12:27:16'),
(535, 54, 'setting_activity_log', 'on', '2022-09-17 12:27:16', '2022-09-17 12:27:16'),
(536, 54, 'setting_unusual_activity', 'on', '2022-09-17 12:27:16', '2022-09-17 12:27:16'),
(537, 54, 'registration_method', 'email', '2022-09-17 12:27:16', '2022-09-17 12:27:16'),
(538, 53, 'profile_phone', '+17028321204', '2022-09-17 12:37:55', '2022-09-17 12:37:55'),
(539, 53, 'profile_dob', '09/01/1996', '2022-09-17 12:37:55', '2022-09-17 12:37:55'),
(540, 53, 'profile_country', 'United States', '2022-09-17 12:37:55', '2022-09-17 12:37:55'),
(541, 55, 'profile_display_name', 'segma', '2022-09-17 15:16:10', '2022-09-17 15:16:10'),
(542, 55, 'profile_avatar_bg', 'azure', '2022-09-17 15:16:10', '2022-09-17 15:16:10'),
(543, 55, 'profile_display_full_name', 'on', '2022-09-17 15:16:10', '2022-09-17 15:16:10'),
(544, 55, 'setting_activity_log', 'on', '2022-09-17 15:16:10', '2022-09-17 15:16:10'),
(545, 55, 'setting_unusual_activity', 'on', '2022-09-17 15:16:10', '2022-09-17 15:16:10'),
(546, 55, 'registration_method', 'email', '2022-09-17 15:16:10', '2022-09-17 15:16:10'),
(547, 56, 'profile_display_name', 'segma', '2022-09-17 22:13:32', '2022-09-17 22:13:32'),
(548, 56, 'profile_avatar_bg', 'info', '2022-09-17 22:13:32', '2022-09-17 22:13:32'),
(549, 56, 'profile_display_full_name', 'on', '2022-09-17 22:13:32', '2022-09-17 22:13:32'),
(550, 56, 'setting_activity_log', 'on', '2022-09-17 22:13:32', '2022-09-17 22:13:32'),
(551, 56, 'setting_unusual_activity', 'on', '2022-09-17 22:13:32', '2022-09-17 22:13:32'),
(552, 56, 'registration_method', 'email', '2022-09-17 22:13:32', '2022-09-17 22:13:32'),
(553, 57, 'profile_display_name', 'segma', '2022-09-17 22:14:22', '2022-09-17 22:14:22'),
(554, 57, 'profile_avatar_bg', 'gray', '2022-09-17 22:14:22', '2022-09-17 22:14:22'),
(555, 57, 'profile_display_full_name', 'on', '2022-09-17 22:14:22', '2022-09-17 22:14:22'),
(556, 57, 'setting_activity_log', 'on', '2022-09-17 22:14:22', '2022-09-17 22:14:22'),
(557, 57, 'setting_unusual_activity', 'on', '2022-09-17 22:14:22', '2022-09-17 22:14:22'),
(558, 57, 'registration_method', 'email', '2022-09-17 22:14:22', '2022-09-17 22:14:22'),
(559, 58, 'profile_display_name', 'segma', '2022-09-17 22:20:39', '2022-09-17 22:20:39'),
(560, 58, 'profile_avatar_bg', 'azure', '2022-09-17 22:20:39', '2022-09-17 22:20:39'),
(561, 58, 'profile_display_full_name', 'on', '2022-09-17 22:20:39', '2022-09-17 22:20:39');
INSERT INTO `user_metas` (`id`, `user_id`, `meta_key`, `meta_value`, `created_at`, `updated_at`) VALUES
(562, 58, 'setting_activity_log', 'on', '2022-09-17 22:20:39', '2022-09-17 22:20:39'),
(563, 58, 'setting_unusual_activity', 'on', '2022-09-17 22:20:39', '2022-09-17 22:20:39'),
(564, 58, 'registration_method', 'email', '2022-09-17 22:20:39', '2022-09-17 22:20:39'),
(565, 59, 'profile_display_name', 'segma', '2022-09-17 22:21:36', '2022-09-17 22:21:36'),
(566, 59, 'profile_avatar_bg', 'primary', '2022-09-17 22:21:36', '2022-09-17 22:21:36'),
(567, 59, 'profile_display_full_name', 'on', '2022-09-17 22:21:36', '2022-09-17 22:21:36'),
(568, 59, 'setting_activity_log', 'on', '2022-09-17 22:21:36', '2022-09-17 22:21:36'),
(569, 59, 'setting_unusual_activity', 'on', '2022-09-17 22:21:36', '2022-09-17 22:21:36'),
(570, 59, 'registration_method', 'email', '2022-09-17 22:21:36', '2022-09-17 22:21:36'),
(571, 59, 'email_verified', '2022-09-17 22:21:36', '2022-09-17 22:21:36', '2022-09-17 22:21:36'),
(572, 59, 'email_verified_last', '2022-09-17 22:21:36', '2022-09-17 22:21:36', '2022-09-17 22:21:36'),
(573, 60, 'profile_display_name', 'segma', '2022-09-17 22:22:43', '2022-09-17 22:22:43'),
(574, 60, 'profile_avatar_bg', 'orange', '2022-09-17 22:22:43', '2022-09-17 22:22:43'),
(575, 60, 'profile_display_full_name', 'on', '2022-09-17 22:22:43', '2022-09-17 22:22:43'),
(576, 60, 'setting_activity_log', 'on', '2022-09-17 22:22:43', '2022-09-17 22:22:43'),
(577, 60, 'setting_unusual_activity', 'on', '2022-09-17 22:22:43', '2022-09-17 22:22:43'),
(578, 60, 'registration_method', 'email', '2022-09-17 22:22:43', '2022-09-17 22:22:43'),
(579, 60, 'email_verified', '2022-09-17 22:22:43', '2022-09-17 22:22:43', '2022-09-17 22:22:43'),
(580, 60, 'email_verified_last', '2022-09-17 22:22:43', '2022-09-17 22:22:43', '2022-09-17 22:22:43'),
(581, 61, 'profile_display_name', 'segma', '2022-09-17 22:24:42', '2022-09-17 22:24:42'),
(582, 61, 'profile_avatar_bg', 'gray', '2022-09-17 22:24:42', '2022-09-17 22:24:42'),
(583, 61, 'profile_display_full_name', 'on', '2022-09-17 22:24:42', '2022-09-17 22:24:42'),
(584, 61, 'setting_activity_log', 'on', '2022-09-17 22:24:42', '2022-09-17 22:24:42'),
(585, 61, 'setting_unusual_activity', 'on', '2022-09-17 22:24:42', '2022-09-17 22:24:42'),
(586, 61, 'registration_method', 'email', '2022-09-17 22:24:42', '2022-09-17 22:24:42'),
(587, 5, 'first_login_at', '2022-09-17 22:35:43', '2022-09-17 22:35:43', '2022-09-17 22:35:43'),
(588, 62, 'profile_display_name', 'segma', '2022-09-17 22:42:18', '2022-09-17 22:42:18'),
(589, 62, 'profile_avatar_bg', 'orange', '2022-09-17 22:42:18', '2022-09-17 22:42:18'),
(590, 62, 'profile_display_full_name', 'on', '2022-09-17 22:42:18', '2022-09-17 22:42:18'),
(591, 62, 'setting_activity_log', 'on', '2022-09-17 22:42:18', '2022-09-17 22:42:18'),
(592, 62, 'setting_unusual_activity', 'on', '2022-09-17 22:42:18', '2022-09-17 22:42:18'),
(593, 62, 'registration_method', 'email', '2022-09-17 22:42:18', '2022-09-17 22:42:18'),
(594, 62, 'email_verified', '2022-09-17 22:42:18', '2022-09-17 22:42:18', '2022-09-17 22:42:18'),
(595, 62, 'email_verified_last', '2022-09-17 22:42:18', '2022-09-17 22:42:18', '2022-09-17 22:42:18'),
(596, 63, 'profile_display_name', 'segma', '2022-09-18 11:48:45', '2022-09-18 11:48:45'),
(597, 63, 'profile_avatar_bg', 'blue', '2022-09-18 11:48:45', '2022-09-18 11:48:45'),
(598, 63, 'profile_display_full_name', 'off', '2022-09-18 11:48:45', '2022-09-18 11:51:06'),
(599, 63, 'setting_activity_log', 'on', '2022-09-18 11:48:45', '2022-09-18 11:48:45'),
(600, 63, 'setting_unusual_activity', 'on', '2022-09-18 11:48:45', '2022-09-18 11:48:45'),
(601, 63, 'registration_method', 'email', '2022-09-18 11:48:45', '2022-09-18 11:48:45'),
(602, 63, 'first_login_at', '2022-09-18 11:50:16', '2022-09-18 11:50:16', '2022-09-18 11:50:16'),
(603, 63, 'profile_phone', '07036269988', '2022-09-18 11:51:06', '2022-09-18 11:51:06'),
(604, 63, 'profile_dob', '06/17/2010', '2022-09-18 11:51:06', '2022-09-18 11:51:06'),
(605, 63, 'profile_country', 'United States', '2022-09-18 11:51:06', '2022-09-18 11:51:06'),
(606, 64, 'profile_display_name', 'Segma', '2022-09-18 12:33:38', '2022-09-18 12:33:38'),
(607, 64, 'profile_avatar_bg', 'info', '2022-09-18 12:33:38', '2022-09-18 12:33:38'),
(608, 64, 'profile_display_full_name', 'on', '2022-09-18 12:33:38', '2022-09-18 12:33:38'),
(609, 64, 'setting_activity_log', 'on', '2022-09-18 12:33:38', '2022-09-18 12:33:38'),
(610, 64, 'setting_unusual_activity', 'on', '2022-09-18 12:33:38', '2022-09-18 12:33:38'),
(611, 64, 'registration_method', 'email', '2022-09-18 12:33:38', '2022-09-18 12:33:38'),
(612, 65, 'profile_display_name', 'Segma', '2022-09-18 12:36:40', '2022-09-18 12:36:40'),
(613, 65, 'profile_avatar_bg', 'blue', '2022-09-18 12:36:40', '2022-09-18 12:36:40'),
(614, 65, 'profile_display_full_name', 'on', '2022-09-18 12:36:40', '2022-09-18 12:36:40'),
(615, 65, 'setting_activity_log', 'on', '2022-09-18 12:36:40', '2022-09-18 12:36:40'),
(616, 65, 'setting_unusual_activity', 'on', '2022-09-18 12:36:40', '2022-09-18 12:36:40'),
(617, 65, 'registration_method', 'email', '2022-09-18 12:36:40', '2022-09-18 12:36:40'),
(618, 66, 'profile_display_name', 'Segma', '2022-09-18 12:37:15', '2022-09-18 12:37:15'),
(619, 66, 'profile_avatar_bg', 'secondary', '2022-09-18 12:37:15', '2022-09-18 12:37:15'),
(620, 66, 'profile_display_full_name', 'on', '2022-09-18 12:37:15', '2022-09-18 12:37:15'),
(621, 66, 'setting_activity_log', 'on', '2022-09-18 12:37:15', '2022-09-18 12:37:15'),
(622, 66, 'setting_unusual_activity', 'on', '2022-09-18 12:37:15', '2022-09-18 12:37:15'),
(623, 66, 'registration_method', 'email', '2022-09-18 12:37:15', '2022-09-18 12:37:15'),
(624, 67, 'profile_display_name', 'Segma', '2022-09-18 13:12:09', '2022-09-18 13:12:09'),
(625, 67, 'profile_avatar_bg', 'warning', '2022-09-18 13:12:09', '2022-09-18 13:12:09'),
(626, 67, 'profile_display_full_name', 'on', '2022-09-18 13:12:09', '2022-09-18 13:12:09'),
(627, 67, 'setting_activity_log', 'on', '2022-09-18 13:12:09', '2022-09-18 13:12:09'),
(628, 67, 'setting_unusual_activity', 'on', '2022-09-18 13:12:09', '2022-09-18 13:12:09'),
(629, 67, 'registration_method', 'email', '2022-09-18 13:12:09', '2022-09-18 13:12:09'),
(630, 68, 'profile_display_name', 'Segma', '2022-09-18 13:30:39', '2022-09-18 13:30:39'),
(631, 68, 'profile_avatar_bg', 'purple', '2022-09-18 13:30:39', '2022-09-18 13:30:39'),
(632, 68, 'profile_display_full_name', 'on', '2022-09-18 13:30:39', '2022-09-18 13:30:39'),
(633, 68, 'setting_activity_log', 'on', '2022-09-18 13:30:39', '2022-09-18 13:30:39'),
(634, 68, 'setting_unusual_activity', 'on', '2022-09-18 13:30:39', '2022-09-18 13:30:39'),
(635, 68, 'registration_method', 'email', '2022-09-18 13:30:39', '2022-09-18 13:30:39'),
(644, 69, 'first_login_at', '2022-09-18 14:31:10', '2022-09-18 14:31:10', '2022-09-18 14:31:10'),
(645, 70, 'profile_display_name', 'Segma', '2022-09-18 14:42:50', '2022-09-18 14:42:50'),
(646, 70, 'profile_avatar_bg', 'azure', '2022-09-18 14:42:50', '2022-09-18 14:42:50'),
(647, 70, 'profile_display_full_name', 'on', '2022-09-18 14:42:50', '2022-09-18 14:42:50'),
(648, 70, 'setting_activity_log', 'on', '2022-09-18 14:42:50', '2022-09-18 14:42:50'),
(649, 70, 'setting_unusual_activity', 'on', '2022-09-18 14:42:50', '2022-09-18 14:42:50'),
(650, 70, 'registration_method', 'email', '2022-09-18 14:42:50', '2022-09-18 14:42:50'),
(651, 70, 'email_verified', '2022-09-18 14:42:50', '2022-09-18 14:42:50', '2022-09-18 14:42:50'),
(652, 70, 'email_verified_last', '2022-09-18 14:42:50', '2022-09-18 14:42:50', '2022-09-18 14:42:50'),
(653, 71, 'profile_display_name', 'Segma', '2022-09-18 14:44:09', '2022-09-18 14:44:09'),
(654, 71, 'profile_avatar_bg', 'orange', '2022-09-18 14:44:09', '2022-09-18 14:44:09'),
(655, 71, 'profile_display_full_name', 'on', '2022-09-18 14:44:09', '2022-09-18 14:44:09'),
(656, 71, 'setting_activity_log', 'on', '2022-09-18 14:44:09', '2022-09-18 14:44:09'),
(657, 71, 'setting_unusual_activity', 'on', '2022-09-18 14:44:09', '2022-09-18 14:44:09'),
(658, 71, 'registration_method', 'email', '2022-09-18 14:44:09', '2022-09-18 14:44:09'),
(659, 71, 'email_verified', '2022-09-18 14:44:09', '2022-09-18 14:44:09', '2022-09-18 14:44:09'),
(660, 71, 'email_verified_last', '2022-09-18 14:44:09', '2022-09-18 14:44:09', '2022-09-18 14:44:09'),
(661, 72, 'profile_display_name', 'Segma', '2022-09-18 14:45:35', '2022-09-18 14:45:35'),
(662, 72, 'profile_avatar_bg', 'teal', '2022-09-18 14:45:35', '2022-09-18 14:45:35'),
(663, 72, 'profile_display_full_name', 'on', '2022-09-18 14:45:35', '2022-09-18 14:45:35'),
(664, 72, 'setting_activity_log', 'on', '2022-09-18 14:45:35', '2022-09-18 14:45:35'),
(665, 72, 'setting_unusual_activity', 'on', '2022-09-18 14:45:35', '2022-09-18 14:45:35'),
(666, 72, 'registration_method', 'email', '2022-09-18 14:45:35', '2022-09-18 14:45:35'),
(667, 72, 'email_verified', '2022-09-18 14:45:35', '2022-09-18 14:45:35', '2022-09-18 14:45:35'),
(668, 72, 'email_verified_last', '2022-09-18 14:45:35', '2022-09-18 14:45:35', '2022-09-18 14:45:35'),
(669, 73, 'profile_display_name', 'Segma', '2022-09-18 14:46:21', '2022-09-18 14:46:21'),
(670, 73, 'profile_avatar_bg', 'blue', '2022-09-18 14:46:21', '2022-09-18 14:46:21'),
(671, 73, 'profile_display_full_name', 'on', '2022-09-18 14:46:21', '2022-09-18 14:46:21'),
(672, 73, 'setting_activity_log', 'on', '2022-09-18 14:46:21', '2022-09-18 14:46:21'),
(673, 73, 'setting_unusual_activity', 'on', '2022-09-18 14:46:21', '2022-09-18 14:46:21'),
(674, 73, 'registration_method', 'email', '2022-09-18 14:46:21', '2022-09-18 14:46:21'),
(675, 73, 'email_verified', '2022-09-18 14:46:21', '2022-09-18 14:46:21', '2022-09-18 14:46:21'),
(676, 73, 'email_verified_last', '2022-09-18 14:46:21', '2022-09-18 14:46:21', '2022-09-18 14:46:21'),
(677, 73, 'first_login_at', '2022-09-18 14:46:59', '2022-09-18 14:46:59', '2022-09-18 14:46:59'),
(678, 74, 'profile_display_name', 'Segma', '2022-09-18 14:50:57', '2022-09-18 14:50:57'),
(679, 74, 'profile_avatar_bg', 'orange', '2022-09-18 14:50:57', '2022-09-18 14:50:57'),
(680, 74, 'profile_display_full_name', 'on', '2022-09-18 14:50:57', '2022-09-18 14:50:57'),
(681, 74, 'setting_activity_log', 'on', '2022-09-18 14:50:57', '2022-09-18 14:50:57'),
(682, 74, 'setting_unusual_activity', 'on', '2022-09-18 14:50:57', '2022-09-18 14:50:57'),
(683, 74, 'registration_method', 'email', '2022-09-18 14:50:57', '2022-09-18 14:50:57'),
(684, 74, 'email_verified', '2022-09-18 14:50:57', '2022-09-18 14:50:57', '2022-09-18 14:50:57'),
(685, 74, 'email_verified_last', '2022-09-18 14:50:57', '2022-09-18 14:50:57', '2022-09-18 14:50:57'),
(686, 74, 'first_login_at', '2022-09-18 14:51:23', '2022-09-18 14:51:23', '2022-09-18 14:51:23'),
(687, 75, 'profile_display_name', 'Haris', '2022-09-19 13:25:27', '2022-09-19 13:25:27'),
(688, 75, 'profile_avatar_bg', 'pink', '2022-09-19 13:25:27', '2022-09-19 13:25:27'),
(689, 75, 'profile_display_full_name', 'on', '2022-09-19 13:25:27', '2022-09-19 13:25:27'),
(690, 75, 'setting_activity_log', 'on', '2022-09-19 13:25:27', '2022-09-19 13:25:27'),
(691, 75, 'setting_unusual_activity', 'on', '2022-09-19 13:25:27', '2022-09-19 13:25:27'),
(692, 75, 'registration_method', 'email', '2022-09-19 13:25:27', '2022-09-19 13:25:27'),
(693, 75, 'email_verified', '2022-09-19 13:25:27', '2022-09-19 13:25:27', '2022-09-19 13:25:27'),
(694, 75, 'email_verified_last', '2022-09-19 13:25:27', '2022-09-19 13:25:27', '2022-09-19 13:25:27'),
(695, 75, 'first_login_at', '2022-09-19 13:25:55', '2022-09-19 13:25:55', '2022-09-19 13:25:55'),
(696, 75, 'profile_phone', '09033923293', '2022-09-19 14:05:57', '2022-09-19 14:05:57'),
(697, 75, 'profile_dob', '08/16/1997', '2022-09-19 14:05:57', '2022-09-19 14:05:57'),
(698, 75, 'profile_country', 'Nigeria', '2022-09-19 14:05:57', '2022-09-19 14:05:57'),
(699, 76, 'profile_display_name', 'Dani', '2022-09-20 03:21:33', '2022-09-20 03:21:33'),
(700, 76, 'profile_avatar_bg', 'danger', '2022-09-20 03:21:33', '2022-09-20 03:21:33'),
(701, 76, 'profile_display_full_name', 'on', '2022-09-20 03:21:33', '2022-09-20 03:21:33'),
(702, 76, 'setting_activity_log', 'on', '2022-09-20 03:21:33', '2022-09-20 03:21:33'),
(703, 76, 'setting_unusual_activity', 'on', '2022-09-20 03:21:33', '2022-09-20 03:21:33'),
(704, 76, 'registration_method', 'email', '2022-09-20 03:21:33', '2022-09-20 03:21:33'),
(705, 76, 'email_verified', '2022-09-20 03:21:33', '2022-09-20 03:21:33', '2022-09-20 03:21:33'),
(706, 76, 'email_verified_last', '2022-09-20 03:21:33', '2022-09-20 03:21:33', '2022-09-20 03:21:33'),
(707, 76, 'first_login_at', '2022-09-20 03:22:00', '2022-09-20 03:22:00', '2022-09-20 03:22:00'),
(708, 76, 'profile_phone', '7028321203', '2022-09-20 03:25:15', '2022-09-20 03:25:15'),
(709, 76, 'profile_dob', '09/12/1995', '2022-09-20 03:25:15', '2022-09-20 03:25:15'),
(710, 76, 'profile_country', 'United States', '2022-09-20 03:25:15', '2022-09-20 03:25:15'),
(711, 77, 'profile_display_name', 'tunde', '2022-09-21 13:12:07', '2022-09-21 13:12:07'),
(712, 77, 'profile_avatar_bg', 'pink', '2022-09-21 13:12:07', '2022-09-21 13:12:07'),
(713, 77, 'profile_display_full_name', 'on', '2022-09-21 13:12:07', '2022-09-21 13:12:07'),
(714, 77, 'setting_activity_log', 'on', '2022-09-21 13:12:07', '2022-09-21 13:12:07'),
(715, 77, 'setting_unusual_activity', 'on', '2022-09-21 13:12:07', '2022-09-21 13:12:07'),
(716, 77, 'registration_method', 'email', '2022-09-21 13:12:07', '2022-09-21 13:12:07'),
(717, 77, 'email_verified', '2022-09-21 13:12:07', '2022-09-21 13:12:07', '2022-09-21 13:12:07'),
(718, 77, 'email_verified_last', '2022-09-21 13:12:07', '2022-09-21 13:12:07', '2022-09-21 13:12:07'),
(719, 77, 'first_login_at', '2022-09-21 13:12:24', '2022-09-21 13:12:24', '2022-09-21 13:12:24'),
(720, 1, 'tnx_order', 'asc', '2022-09-24 09:49:09', '2022-09-24 09:50:08'),
(721, 78, 'profile_display_name', 'Morgan', '2022-09-24 10:00:07', '2022-09-24 10:00:07'),
(722, 78, 'profile_avatar_bg', 'danger', '2022-09-24 10:00:07', '2022-09-24 10:00:07'),
(723, 78, 'profile_display_full_name', 'on', '2022-09-24 10:00:07', '2022-09-24 10:00:07'),
(724, 78, 'setting_activity_log', 'on', '2022-09-24 10:00:07', '2022-09-24 10:00:07'),
(725, 78, 'setting_unusual_activity', 'on', '2022-09-24 10:00:07', '2022-09-24 10:00:07'),
(726, 78, 'registration_method', 'email', '2022-09-24 10:00:07', '2022-09-24 10:00:07'),
(727, 78, 'email_verified', '2022-09-24 10:00:08', '2022-09-24 10:00:08', '2022-09-24 10:00:08'),
(728, 78, 'email_verified_last', '2022-09-24 10:00:08', '2022-09-24 10:00:08', '2022-09-24 10:00:08'),
(729, 78, 'first_login_at', '2022-09-24 10:00:46', '2022-09-24 10:00:46', '2022-09-24 10:00:46'),
(730, 78, 'profile_phone', '+17028321204', '2022-09-24 10:07:22', '2022-09-24 10:07:22'),
(731, 78, 'profile_dob', '10/08/1999', '2022-09-24 10:07:22', '2022-09-24 10:07:22'),
(732, 78, 'profile_country', 'United States', '2022-09-24 10:07:22', '2022-09-24 10:07:22'),
(733, 79, 'profile_display_name', 'ali', '2023-01-24 16:10:38', '2023-01-24 16:10:38'),
(734, 79, 'profile_avatar_bg', 'orange', '2023-01-24 16:10:38', '2023-01-24 16:10:38'),
(735, 79, 'profile_display_full_name', 'on', '2023-01-24 16:10:38', '2023-01-24 16:10:38'),
(736, 79, 'setting_activity_log', 'on', '2023-01-24 16:10:38', '2023-01-24 16:10:38'),
(737, 79, 'setting_unusual_activity', 'on', '2023-01-24 16:10:38', '2023-01-24 16:10:38'),
(738, 79, 'registration_method', 'email', '2023-01-24 16:10:38', '2023-01-24 16:10:38'),
(739, 79, 'email_verified', '2023-01-24 16:10:38', '2023-01-24 16:10:38', '2023-01-24 16:10:38'),
(740, 79, 'email_verified_last', '2023-01-24 16:10:38', '2023-01-24 16:10:38', '2023-01-24 16:10:38'),
(741, 79, 'first_login_at', '2023-01-24 16:11:29', '2023-01-24 16:11:29', '2023-01-24 16:11:29');

-- --------------------------------------------------------

--
-- Table structure for table `verify_tokens`
--

CREATE TABLE `verify_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `email` varchar(191) NOT NULL,
  `token` varchar(191) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `verify` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verify_tokens`
--

INSERT INTO `verify_tokens` (`id`, `user_id`, `email`, `token`, `code`, `verify`, `created_at`, `updated_at`) VALUES
(1, 1, 'serikioluwagbenga@gmail.com', '95f9b682297ceeb5da9c6521331525082445cc96', '586122', '2022-04-14 21:47:16', '2022-04-14 20:47:16', '2022-04-14 20:47:16'),
(2, 2, 'johnsmithus6422@gmail.com', NULL, '543894', '2022-06-27 19:20:40', '2022-04-14 21:04:28', '2022-06-27 18:20:40'),
(3, 3, 'ssitnigeria@gmail.com', 'a11946ba497d05aae216ee56067d60bd9664777e', '383206', NULL, '2022-04-19 11:43:57', '2022-04-19 11:43:57'),
(4, 4, 'ssitnigeria@gmail.com', '140e7442f861684260745f2fb1afca21a655b10a', '533706', NULL, '2022-04-19 12:22:39', '2022-04-19 12:22:39'),
(5, 5, 'ssitnigeria@gmail.com', '139741790670955948ac5a72e32c160ddd3b16a0', '490863', NULL, '2022-04-19 12:41:11', '2022-04-19 12:41:11'),
(7, 1, 'support@mintcapitalfx.com', 'd00852073c394fad735636e403fe826711cfc3c1', '760160', '2022-04-19 21:01:56', '2022-04-19 20:01:03', '2022-04-19 20:01:56'),
(8, 6, 'aniss.ramzi04@gmail.com', '6ff8e78e6923416a49e2edbb66d96fa4b7eae297', '898517', '2022-04-20 07:21:12', '2022-04-20 06:20:35', '2022-04-20 06:21:12'),
(9, 7, 'p.nosic98@gmail.com', '4750a2708c50e3a3f6018f7bf581a69bd74ba5a3', '528620', '2022-04-21 11:06:09', '2022-04-21 10:05:13', '2022-04-21 10:06:09'),
(10, 8, 'bronxbaby123@icloud.com', '79fa01939d3f1a4b0becfb7c1c9275ddf5d3aa02', '916259', '2022-04-27 04:40:11', '2022-04-27 03:32:28', '2022-04-27 03:40:11'),
(11, 10, 'jermainem354@gmail.com', 'd720298da386527abcdd6f5d33f3fcbb4712f29d', '587833', '2022-04-27 04:44:31', '2022-04-27 03:44:05', '2022-04-27 03:44:31'),
(12, 11, 'maisonbaez2004@gmail.com', NULL, '979153', '2022-06-16 00:07:14', '2022-04-28 20:51:41', '2022-06-15 23:07:14'),
(13, 12, 'a5hton4321.1234@gmail.com', 'e49eb8370f8a479ff61a2ddfd5bf05c055771ef6', '885795', NULL, '2022-04-29 11:59:24', '2022-04-29 13:20:29'),
(14, 13, 'Eminentprince34@gmail.com', 'de186f0f6f7119ab7288a061a23f3adc66c9bee0', '165761', '2022-04-29 13:50:27', '2022-04-29 12:15:09', '2022-04-29 12:50:27'),
(15, 14, 'labakycharbel1@gmail.com', 'd55f5b636d334754c1ddfcf60fda41202a0c51c5', '318191', '2022-05-01 07:28:55', '2022-05-01 06:27:20', '2022-05-01 06:28:55'),
(16, 15, 'sebswibaut75@gmail.com', 'efa1fa1d94cc98c9bd90512d83d06014e9355e92', '458512', NULL, '2022-05-02 14:42:00', '2022-05-02 15:29:53'),
(17, 16, 'meshachray1@gmail.com', '53bea131f59305d70a5d8d52458d9edf157bcf2b', '283908', '2022-05-02 19:36:48', '2022-05-02 18:36:09', '2022-05-02 18:36:48'),
(18, 17, 'meshachab@gmail.com', '7ddbd58645057b08dddcee99f7b5e68c0ce88546', '685151', '2022-05-02 19:45:27', '2022-05-02 18:39:27', '2022-05-02 18:45:27'),
(19, 18, 'angelcr590@gmail.com', 'f06374ad7eb8875921f0adc76c0ec251d053f0d4', '526876', '2022-05-03 07:54:46', '2022-05-03 06:52:46', '2022-05-03 06:54:46'),
(20, 19, 'futurerichies356@gmail.com', 'baf0d9286442ae427cf7a29bc16ad41608a0330d', '925693', '2022-05-10 18:42:50', '2022-05-10 17:41:10', '2022-05-10 17:42:50'),
(21, 20, 'futurerichies@gmail.com', '42b5f558f3ec9272370c85e0981eb32e0163701c', '873196', NULL, '2022-05-10 17:44:46', '2022-05-10 18:28:23'),
(22, 21, 'bearcubs11@gmail.com', '207657c59dc27fa0c440cabd0c32900dba2f10e2', '672499', NULL, '2022-05-11 17:56:19', '2022-05-11 19:32:07'),
(23, 22, 'motion0974@gmail.com', '995892a99892d6619ddb15f65856719f970234be', '954486', '2022-05-13 05:42:26', '2022-05-13 04:41:27', '2022-05-13 04:42:26'),
(24, 23, 'cihangir.sucu@gmail.com', 'c1ab6878619d47b0202d17f5caf597eb0932cc48', '942460', '2022-05-13 11:51:35', '2022-05-13 10:47:58', '2022-05-13 10:51:35'),
(25, 24, 'baushta@ukr.net', '36be649cbdc95c1c929874f13e7fc7a9f91c15de', '381000', '2022-05-18 18:37:25', '2022-05-18 17:09:13', '2022-05-18 17:37:25'),
(26, 25, 'romesh_@bk.ru', 'de6d68062c2738d477b447f4bc9932a2bc3c89ba', '826305', '2022-05-19 07:07:21', '2022-05-19 06:04:58', '2022-05-19 06:07:21'),
(27, 26, 'erickmartinezespina@outlook.com', 'c2b5b394514e7858dbad5591a1558ce7934fdbd9', '979093', '2022-05-20 16:56:09', '2022-05-20 15:55:04', '2022-05-20 15:56:09'),
(28, 27, 'viveksimhadri2222@gmail.com', 'efc22e2525acfe772b680a124b64ca51c340f38f', '187833', '2022-05-22 12:24:27', '2022-05-22 11:23:16', '2022-05-22 11:24:27'),
(29, 28, 'fir193173@gmail.com', 'fa58d0ec0c8c0f30b00f1a708f097b2df662793e', '842581', '2022-05-22 13:25:14', '2022-05-22 12:23:35', '2022-05-22 12:25:14'),
(30, 29, 'olleotti.le@gmail.com', '9a8667d48019c3874ba7dfc1f9f04f5e31f5af8b', '464395', '2022-05-22 20:01:43', '2022-05-22 18:57:30', '2022-05-22 19:01:43'),
(31, 30, 'ugnebut17@gmail.com', '02ab1244c6fab1ebc8a76f30f0ac593109eaf9a9', '699488', '2022-06-09 03:16:15', '2022-06-09 02:15:11', '2022-06-09 02:16:15'),
(32, 31, 'aa.iph4@gmail.com', 'dade0490cf0f084d16a0367ef1e1f14277871c12', '224021', NULL, '2022-06-10 21:48:00', '2022-06-11 00:14:08'),
(33, 32, 'jamesfranklyn785@gmail.com', 'bef8836daada69b031311245a51ed4f0c3401032', '996999', NULL, '2022-06-12 15:12:52', '2022-06-12 17:50:11'),
(34, 33, 'sem.servin@hotmail.com', '2f54056c36ce30cd8b51b4cacf6f093a61d8e41d', '864087', NULL, '2022-06-12 20:12:02', '2022-06-12 20:12:02'),
(35, 35, 'sem.tsai.121@hotmail.com', NULL, '963475', NULL, '2022-06-12 20:13:12', '2022-06-12 20:23:36'),
(36, 36, 'deivisj220@gmail.com', NULL, '599643', '2022-06-13 22:07:21', '2022-06-13 21:03:49', '2022-06-13 21:07:21'),
(37, 37, 'widlynjoseph20@gmail.com', 'e819b571336daedb1b813e96d8f945b6c298b918', '962579', NULL, '2022-06-17 17:25:50', '2022-06-17 19:03:32'),
(38, 38, 'edwinlangi22@outlooks.com', 'dee47ba549f5a76b8264c301da98e8bea3a8e822', '521405', NULL, '2022-07-06 06:00:34', '2022-07-06 06:00:34'),
(39, 39, 'edwinlangi@outlook.com', 'f73a0cc894f5c9c806c9c9f74dadd26661510c73', '177065', NULL, '2022-07-06 06:01:08', '2022-07-06 06:01:08'),
(40, 40, 'edwinlangi22@outlook.com', 'b403294bd32d7f55ef84f9806529265c75b337df', '188787', '2022-07-06 07:03:34', '2022-07-06 06:03:08', '2022-07-06 06:03:34'),
(41, 41, 'taylorrigby@u.boisestate.edu', '8d98e689415bcd985565550d58ca2a1c839ff4bd', '884550', '2022-07-11 17:18:13', '2022-07-11 16:17:31', '2022-07-11 16:18:13'),
(42, 42, 'mrttamwera@gmail.com', '48a2e5640e6df32b348b7fca42e370bbff99aed5', '704062', NULL, '2022-07-24 21:33:20', '2022-07-25 02:12:00'),
(43, 43, 'lilly@gmail.com', 'b3ae1d273ed95b17a202cd4b1024ee2d4bf8b373', '986942', NULL, '2022-07-25 01:02:25', '2022-07-25 01:02:25'),
(44, 45, 'omasang25@gmail.com', 'a2414a93f71380edc598e1b6146e9788e23cd27d', '842324', NULL, '2022-07-25 11:21:58', '2022-07-25 11:21:58'),
(45, 46, 'omasabg25@gmail.com', '63ad8f86500b9d579d7c9c189ab989ed5cfee54d', '252118', NULL, '2022-07-25 11:57:17', '2022-07-25 11:57:17'),
(46, 47, 'tebakia1@gmail.com', '255cc4d77acfe6c6de243f410bdc77178bd1b9c4', '788931', '2022-07-29 07:33:47', '2022-07-28 13:53:05', '2022-07-29 06:33:47'),
(47, 48, 'tebatebakia1@gmail.com', '39082686bf3870ad4d994a141c3ef5e1377e262e', '499860', NULL, '2022-07-29 06:33:01', '2022-07-29 06:33:01'),
(48, 49, 'gaugeferrell5@gmail.com', '3be1c9df1d83c83991048d2362992f89f100166a', '523927', '2022-08-04 20:12:53', '2022-08-04 19:12:11', '2022-08-04 19:12:53'),
(49, 50, 'icondeminas@hotmail.com', '67f5634961aa51faf28bf659cd67f269e2e36e6d', '955395', '2022-08-14 11:46:48', '2022-08-14 10:46:05', '2022-08-14 10:46:48'),
(50, 51, 'yayameredith16@gmail.com', '1c49073cb1c7e13d3f66b72c8ee1cfd9a3cab05f', '536740', NULL, '2022-08-15 01:16:13', '2022-08-15 01:16:13'),
(51, 52, 'larrybernice98@gmail.com', '001647f74096d47b9e8103ab256d416d3a3aa36c', '531439', NULL, '2022-09-16 21:50:28', '2022-09-16 21:50:28'),
(52, 52, 'larrybernice99@gmail.com', 'bb44083173477424fac7e51fde1ac6fcda92c60d', '634311', NULL, '2022-09-16 21:54:34', '2022-09-16 21:54:34'),
(53, 53, 'randybernice54@gmail.com', '45269740775371e9d736fd11e83dd4d88e696c22', '947506', NULL, '2022-09-17 11:15:20', '2022-09-24 09:53:55'),
(54, 54, 'perry187818@gmail.com', 'd3b57db5043254a42f97f69b543b6a6deef5cdca', '541969', NULL, '2022-09-17 12:27:16', '2022-09-17 12:27:16'),
(55, 55, 'serikioluwagbenga@gmail.com', 'ea11329acae44817888b11bffd229c39231b87c7', '527802', NULL, '2022-09-17 15:16:10', '2022-09-17 15:16:10'),
(56, 56, 'serikioluwagbenga@gmail.com', '3062512d46ce49d4c4cadce24d6d512d9b74c801', '780979', NULL, '2022-09-17 22:13:32', '2022-09-17 22:13:32'),
(57, 57, 'segma@gmail.com', 'dbc667c9c492b1bdddcf0644b9d8f12028c22779', '975646', NULL, '2022-09-17 22:14:22', '2022-09-17 22:14:22'),
(58, 58, 'serikioluwagbenga@gmail.com', '022b9b8055f70dfc69578f020ea5848ee6a5972c', '740238', NULL, '2022-09-17 22:20:39', '2022-09-17 22:20:39'),
(59, 59, 'Segma@gmail.com', 'f73a2d229458d6d8583a706aa8e0aa63672b2dc0', '663333', '2022-09-17 22:21:36', '2022-09-17 22:21:36', '2022-09-17 22:21:36'),
(60, 60, 'serikioluwagbenga@gmail.com', '540c9d10f5603b78c17ba949d84c7bb84b1cf2e5', '573806', '2022-09-17 22:22:43', '2022-09-17 22:22:43', '2022-09-17 22:22:43'),
(61, 62, 'serikioluwagbenga@gmail.com', 'fa240d0dff47e0ae838ada0f69c7ca388322058e', '498802', '2022-09-17 22:42:18', '2022-09-17 22:42:18', '2022-09-17 22:42:18'),
(62, 63, 'serikioluwagbenga@gmail.com', 'c688390d0e7b8f076a903fcbe9091c94572c07e0', '289054', NULL, '2022-09-18 11:48:45', '2022-09-18 11:48:45'),
(63, 64, 'serikioluwagbenga@gmail.com', '675aa12ec27ff3b70776ba09fad580f267975da6', '960400', NULL, '2022-09-18 12:33:38', '2022-09-18 12:33:38'),
(64, 65, 'serikioluwagbenga@gmail.com', '0042798a3a118be62979a1cebd32bc2f6ed29814', '491322', NULL, '2022-09-18 12:36:40', '2022-09-18 12:36:40'),
(65, 66, 'segma@gmail.com', 'dc6b5d0f38bab6f3ea2c0621753d75169b94968e', '146117', NULL, '2022-09-18 12:37:15', '2022-09-18 12:37:15'),
(66, 67, 'serikioluwagbenga@gmail.com', 'd4342845a876473206f269b9aad48c9b9ec54287', '762153', NULL, '2022-09-18 13:12:09', '2022-09-18 13:12:09'),
(67, 68, 'colagunju0@gmail.com', '96f29abfacb389baf7aee39834014043107c9ae7', '350479', NULL, '2022-09-18 13:30:39', '2022-09-18 13:30:39'),
(68, 69, 'serikioluwagbenga@gmail.com', '539f8bca4f92129d337a0c085d107c80b5e0cfef', '850339', '2022-09-18 14:28:53', '2022-09-18 14:28:53', '2022-09-18 14:28:53'),
(69, 70, 'serikioluwagbenga@gmail.com', '81064d71264461d98f1b1698aa0830836091ff1b', '849570', '2022-09-18 14:42:50', '2022-09-18 14:42:50', '2022-09-18 14:42:50'),
(70, 71, 'serikioluwagbenga@gmail.com', '9adfcc3cd2500eda0571e9a9201efbe743bd24ba', '350492', '2022-09-18 14:44:09', '2022-09-18 14:44:09', '2022-09-18 14:44:09'),
(71, 72, 'serikioluwagbenga@gmail.com', '58246dced548e54f4c20959976c0e4dc6323b99f', '770234', '2022-09-18 14:45:35', '2022-09-18 14:45:35', '2022-09-18 14:45:35'),
(72, 73, 'serikioluwagbenga@gmail.com', 'f3ced0e6a96ffab02171c692bdc43a041368b890', '978549', '2022-09-18 14:46:21', '2022-09-18 14:46:21', '2022-09-18 14:46:21'),
(73, 74, 'segma@gmail.com', '69cf1ae1f187480f907649c547709fd04da90f66', '369584', '2022-09-18 14:50:57', '2022-09-18 14:50:57', '2022-09-18 14:50:57'),
(74, 75, 'armyy3025@gmail.com', '1f556f6021a593679b7eac7c359598a7704a89a7', '713178', '2022-09-19 13:25:27', '2022-09-19 13:25:27', '2022-09-19 13:25:27'),
(75, 76, 'Danidan187818@gmail.com', '0b94c3e213243044f1133b762492dd49407a5d1f', '118330', '2022-09-20 03:21:33', '2022-09-20 03:21:33', '2022-09-20 03:21:33'),
(76, 77, 'Colagunju0@gmail.com', '45d039cace2cbdb14b7241ae104900ca7424eb3e', '589988', '2022-09-21 13:12:07', '2022-09-21 13:12:07', '2022-09-21 13:12:07'),
(77, 78, 'juliamorgann190@gmail.com', '73e0f66b439d171b5fc53763ee21169db3ec6ae7', '237216', '2022-09-24 10:00:08', '2022-09-24 10:00:07', '2022-09-24 10:00:08'),
(78, 79, 'hammadarlis2@gmail.com', '8832748b22a0cfb0908b64c4842cfe7c11a24399', '948425', '2023-01-24 16:10:38', '2023-01-24 16:10:38', '2023-01-24 16:10:38');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `desc` varchar(191) NOT NULL,
  `min_amount` varchar(191) DEFAULT NULL,
  `max_amount` varchar(191) DEFAULT NULL,
  `config` text NOT NULL,
  `fees` text DEFAULT NULL,
  `currencies` text NOT NULL,
  `countries` text DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_methods`
--

INSERT INTO `withdraw_methods` (`id`, `slug`, `name`, `desc`, `min_amount`, `max_amount`, `config`, `fees`, `currencies`, `countries`, `status`, `created_at`, `updated_at`) VALUES
(1, 'wd-paypal', 'BTC', 'Withdraw your fund through BTC wallet', '10', '1000000', '{\"meta\":{\"title\":null,\"currency\":\"USD\",\"min\":\"0\",\"max\":\"0\"},\"currencies\":{\"USD\":{\"min\":\"10\",\"max\":\"1000000\"},\"EUR\":{\"min\":\"0\",\"max\":\"0\"},\"GBP\":{\"min\":\"0\",\"max\":\"0\"},\"CAD\":{\"min\":\"0\",\"max\":\"0\"},\"AUD\":{\"min\":\"0\",\"max\":\"0\"},\"RUB\":{\"min\":\"0\",\"max\":\"0\"},\"BRL\":{\"min\":\"0\",\"max\":\"0\"},\"MXN\":{\"min\":\"0\",\"max\":\"0\"}},\"api\":[]}', NULL, '[\"USD\"]', '[]', 'active', '2022-05-02 15:09:07', '2022-05-02 15:09:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_templates_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iv_actions`
--
ALTER TABLE `iv_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iv_actions_type_id_index` (`type_id`);

--
-- Indexes for table `iv_invests`
--
ALTER TABLE `iv_invests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iv_ledgers`
--
ALTER TABLE `iv_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iv_profits`
--
ALTER TABLE `iv_profits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iv_profits_user_id_index` (`user_id`);

--
-- Indexes for table `iv_schemes`
--
ALTER TABLE `iv_schemes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iv_schemes_slug_unique` (`slug`);

--
-- Indexes for table `iv_scheme_metas`
--
ALTER TABLE `iv_scheme_metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

--
-- Indexes for table `ledgers`
--
ALTER TABLE `ledgers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ledgers_transaction_id_unique` (`transaction_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_methods_slug_unique` (`slug`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_codes`
--
ALTER TABLE `referral_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `referral_codes_code_unique` (`code`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_tnx_unique` (`tnx`),
  ADD KEY `transactions_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_activities`
--
ALTER TABLE `user_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_metas`
--
ALTER TABLE `user_metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verify_tokens`
--
ALTER TABLE `verify_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iv_actions`
--
ALTER TABLE `iv_actions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `iv_invests`
--
ALTER TABLE `iv_invests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iv_ledgers`
--
ALTER TABLE `iv_ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=428;

--
-- AUTO_INCREMENT for table `iv_profits`
--
ALTER TABLE `iv_profits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iv_schemes`
--
ALTER TABLE `iv_schemes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `iv_scheme_metas`
--
ALTER TABLE `iv_scheme_metas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ledgers`
--
ALTER TABLE `ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_codes`
--
ALTER TABLE `referral_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_activities`
--
ALTER TABLE `user_activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_metas`
--
ALTER TABLE `user_metas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=742;

--
-- AUTO_INCREMENT for table `verify_tokens`
--
ALTER TABLE `verify_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
