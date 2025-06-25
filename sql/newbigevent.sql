/*
 Navicat Premium Data Transfer

 Source Server         : lacanmsql
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : newbigevent

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 25/06/2025 14:26:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for announcements
-- ----------------------------
DROP TABLE IF EXISTS `announcements`;
CREATE TABLE `announcements`  (
  `id` int unsigned NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` datetime(0) DEFAULT CURRENT_TIMESTAMP,
  `isexit` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1',
  `createuser` int unsigned NOT NULL,
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of announcements
-- ----------------------------
INSERT INTO `announcements` VALUES (3, '小镇姑娘', '陶喆', '2025-01-05 18:36:02', 'true', 5, '管理员');
INSERT INTO `announcements` VALUES (4, '创作新规', '为了维护社区的内容质量与用户体验，平台决定对发布无实质性内容、纯粹为了增加阅读量的“水文章”进行严格管控。任何涉及虚假、无意义、重复性内容的文章将被视为违规行为。\r\n\r\n平台将加强对文章的审核力度，对于发现的“水文章”将采取相应措施，包括文章删除和账号处罚等。对于屡次发布水文章的账号，平台将视情况进行警告或封号处理。\r\n\r\n同时，平台将进一步提升文章内容审核的标准，确保发布内容的质量，打造健康的社区环境。\r\n\r\n请各位创作者共同遵守平台规定，保持社区环境的健康发展。我们鼓励每一位创作者发布有价值、有深度的内容，分享真实、有意义的信息。\r\n\r\n感谢大家的支持与理解！\r\n\r\n平台团队\r\n2025.01.5', '2025-01-05 19:29:04', 'true', 5, '创作者');
INSERT INTO `announcements` VALUES (5, '11111111111111', '2222222222222222222222222', '2025-01-05 21:26:54', 'true', 5, '创作者');
INSERT INTO `announcements` VALUES (6, '公告：封禁管理员，十分热度', '<h3><br></h3><p>亲爱的用户们：</p><p>在我们平台的日常运营中，我们始终秉持着公平、公正、透明的原则，致力于为大家提供一个健康、和谐的社区环境。近期，平台发现部分管理员行为不当，违反了平台的相关管理规定，导致了不良的用户体验和平台秩序的破坏。</p><p>为了保障平台的正常运营，我们决定对该部分管理员进行严格处理，并已对其实施封禁。具体原因如下：</p><ul><li><strong>不遵守平台规范</strong>：在平台管理中未严格执行平台规则，导致平台秩序受损；</li><li><strong>滥用职权</strong>：以管理员身份进行不当行为，包括但不限于权力滥用、歧视性行为等；</li><li><strong>违背公平原则</strong>：未能保持管理的公正性，导致平台内用户之间的矛盾激化。</li></ul><p>我们对违反平台规定的行为零容忍，已经采取了封禁该管理员账号的措施，并会继续加强平台管理，确保每一位用户和管理员都能在一个健康、公正的环境中参与互动。</p><p><strong>特别提醒</strong>：所有平台成员，无论是管理员还是普通用户，都必须遵守平台规定和行为准则。任何不符合规范的行为，都将被严肃处理。</p><p>我们感谢广大用户对平台的支持与理解，平台将继续为大家提供一个公平、公正的社区环境，让每个用户都能在这里尽情发挥自己的才华与创意。</p><p>平台团队</p><p>[日期]</p><p>这篇公告简要说明了管理员违规的行为</p>', '2025-01-05 21:27:01', 'true', 5, '创作者');
INSERT INTO `announcements` VALUES (7, '平台更新说明', '<p> 平台将于2025年1月10日更新,请做好准备</p>', '2025-01-06 08:11:52', 'false', 5, '创作者');
INSERT INTO `announcements` VALUES (8, '管理员禁止胡乱审核', '<p> 禁止以不当理由退回作者稿件。。</p>', '2025-01-06 08:27:42', 'false', 19, '管理员');
INSERT INTO `announcements` VALUES (9, '禁止漏审、错审', '<p> 坚决抵制错审！！！！！！！！！！！！</p>', '2025-01-06 08:30:34', 'true', 19, '管理员');
INSERT INTO `announcements` VALUES (10, '平台升级公告', '<p> 本平台将于1.7日下午进行升级</p>', '2025-01-07 17:12:07', 'true', 5, '创作者');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int unsigned NOT NULL COMMENT 'ID',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `content` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章内容',
  `cover_img` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章封面',
  `state` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '草稿' COMMENT '文章状态: 只能是[已发布] 或者 [草稿]',
  `category_id` int unsigned COMMENT '文章分类ID',
  `create_user` int unsigned NOT NULL COMMENT '创建人ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  `browse` int unsigned COMMENT '浏览量',
  `isexit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_article_category`(`category_id`) USING BTREE,
  INDEX `fk_article_user`(`create_user`) USING BTREE,
  CONSTRAINT `fk_article_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_article_user` FOREIGN KEY (`create_user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '西安兵马俑', 'jhhhhhhhhhhhh', 'http:baidu.com', '草稿', 1, 1, '2024-12-20 17:50:36', '2024-12-21 16:20:14', 0, 'true');
INSERT INTO `article` VALUES (3, 'GPT3', '1111111111', '', '草稿', 4, 1, '2024-12-25 11:13:31', '2024-12-25 15:22:06', 3, 'true');
INSERT INTO `article` VALUES (4, '清朝的经济制度你知道吗', '<p>那你知道金额和嘿嘿费用</p>', '', '已发布', 4, 3, '2024-12-25 11:18:11', '2024-12-25 20:25:55', 42, 'true');
INSERT INTO `article` VALUES (5, '《太阳照常升起》的魔幻现实主义', '<p><span style=\"color: rgb(84, 84, 84);\">不可能再有这样的电影了，走进电影院，不知道会发生什么，走出电影院，突然惊觉：这貌似遥远的一切，都与我有关。</span></p><p><span style=\"color: rgb(84, 84, 84);\">这就是姜文的</span><strong style=\"color: rgb(81, 29, 231);\">《太阳照常升起》</strong><span style=\"color: rgb(84, 84, 84);\">，华美魔幻却又现实的不得了。</span></p><p><span style=\"color: rgb(84, 84, 84);\">今天我们就来聊聊这部“中国往事”，它也被许多人认为是姜文最难懂的电影。</span></p>', '', '已发布', 10, 3, '2024-12-25 14:18:55', '2024-12-25 14:18:55', 41, 'true');
INSERT INTO `article` VALUES (6, '《红辣椒》人物内心世界', '<p>    动画电影能通过图像和故事情节向观众传递信息和情感，对动画电影中的人物形象进行精神分析的研究，可以揭示人物角色背后的心理层面，增进对故事和情节的理解。</p><p>   本文旨在通过运用精神分析理论，审视动画电影《红辣椒》中的人物形象，并探讨人物心理与电影主题之间的关联。研究方法主要基于对电影情节和人物行为的观察，并结合精神分析理论进行解读。</p>', '', '已发布', 11, 3, '2024-12-25 14:26:56', '2024-12-26 10:57:19', 67, 'true');
INSERT INTO `article` VALUES (7, '中国传统文化热潮', '<p> 中国传统文化热潮现象在近年来尤为显著，特别是在年轻人群体中，这一热潮以“国风热”为主要表现形式，展现出了强大的生命力和影响力。以下是对中国传统文化热潮现象的详细分析：</p><p> <strong>一、现象概述</strong></p><p>“国风热”在年轻人中悄然兴起，一股传统文化热潮席卷全国。从“新中式”服装到“围炉煮茶”，从跳古典舞到制作古风美食，再到学习非遗技艺等，国风凭借其独特的文化韵味和丰富的表现力，迅速在青年群体中“圈粉”。</p><p> <strong>二、现象表现</strong></p><p>1、服饰：</p><p>汉服、唐装、马面裙等中国传统服饰成为青年人时尚的新宠。一些曾经只能在电视剧中看到的中国古代着装，如今在日常生活中也常常能看到年轻人穿着。甚至一些海外的中国留学生也将汉服作为自己毕业典礼的服饰。</p><p>2、饮食：</p><p>古风美食也逐渐受到年轻人的追捧，他们通过制作和品尝古风美食，来体验和感受传统文化的魅力。</p><p>3、艺术：</p><p>传统戏剧以新方式演绎，古风歌曲也通过各种形式打动年轻人。同时，越来越多的年轻人开始学习剪纸、茶艺等传统技艺，并将其融入现代生活中，创作出具有现代审美和创意的作品。</p><p>4、娱乐：</p><p>传统文化元素也融入了现代娱乐形式中。例如，在游戏中加入充满“中国味”的元素，或者在短视频平台上以现代的表达方式展示戏曲的魅力等。</p><p> <strong>三、现象成因</strong></p><p>1、文化自觉与文化自信的提升：</p><p>随着党和国家对于社会主义文化建设的重视程度不断提高，相关政策措施逐步推进落实，国民的文化自信也日益提升。新时代青年对于“国风”文化的兴趣也逐渐加强，他们开始重新审视和认同自己的传统文化。</p><p>2、社会价值观的重塑：</p><p>年轻一代的文化消费观念正在悄然改变，他们更倾向于通过社交媒体获取文化娱乐信息，并热衷于参与和创造内容。这种趋势促使传统文化机构和艺术家转型以适应新的市场需求，同时也推动了传统文化的再生和创新。</p><p>3、精神需求的满足：</p><p>在快节奏的现代社会中，人们越来越渴望寻找一份宁静和精神的丰盈。中华优秀传统文化中的丰富内涵如“仁、德、礼、法、和”的追求以及“风雅”“淡泊”“中庸”等为人处世的哲学为人们提供了精神滋养和心灵慰藉。</p>', '', '已发布', 8, 3, '2024-12-25 14:33:58', '2024-12-25 14:33:58', 94, 'true');
INSERT INTO `article` VALUES (8, '明朝那些事', '<p> 民命的空军的飞机付费u解放和热火覅u既符合</p>', '', '已发布', 5, 3, '2024-12-25 14:55:41', '2024-12-25 14:55:41', 36, 'true');
INSERT INTO `article` VALUES (9, '淄博最美齐文化', '<p> 你肌肤水分几乎发挥发挥热咖啡般若辜负你</p>', '', '草稿', 8, 3, '2024-12-25 15:35:35', '2024-12-25 15:35:53', 43, 'true');
INSERT INTO `article` VALUES (10, '古代热梗有哪些', '<p>明朝的基本观点不是科技大国实地调查</p>', '', '草稿', 8, 3, '2024-12-25 16:16:45', '2024-12-25 16:16:45', 58, 'true');
INSERT INTO `article` VALUES (11, '中美的人工智能斗争', '<p>111</p>', '', '已发布', 4, 3, '2024-12-25 19:26:56', '2024-12-26 20:23:15', 64, 'true');
INSERT INTO `article` VALUES (12, '机器学习贵在坚持？', '<p> 222</p>', '', '已发布', 4, 3, '2024-12-25 19:27:06', '2024-12-26 20:23:30', 39, 'true');
INSERT INTO `article` VALUES (13, '神经网络', '<p> 333333333333</p>', '', '已发布', 4, 3, '2024-12-25 19:27:14', '2024-12-26 20:23:40', 29, 'true');
INSERT INTO `article` VALUES (14, '文心一言', '<p> 4444444444</p>', '', '审核未通过', 4, 3, '2024-12-25 19:27:24', '2025-01-08 09:52:34', 23, 'true');
INSERT INTO `article` VALUES (15, 'AI5', '<p> 55555555555555555555555</p>', '', '审核未通过', 4, 3, '2024-12-25 19:27:33', '2025-01-08 09:52:30', 99, 'true');
INSERT INTO `article` VALUES (16, '美国人为什么喜欢汉堡', '<p> 我也不知道</p>', '', '已发布', 5, 3, '2024-12-25 20:35:49', '2024-12-25 20:35:49', 4, 'true');
INSERT INTO `article` VALUES (18, '科比为什么是科比', '<p> man，what can I say!</p>', '', '审核未通过', 15, 5, '2024-12-27 14:22:00', '2024-12-27 14:48:29', 0, 'true');
INSERT INTO `article` VALUES (19, '沙克干了吗？', '<p> 我也不知道</p>', '', '审核未通过', 4, 3, '2024-12-27 14:25:30', '2025-01-06 15:17:17', 0, 'true');
INSERT INTO `article` VALUES (21, '中国大模型', '<p>iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii</p>', '', '已发布', 4, 3, '2024-12-30 14:58:56', '2024-12-30 15:00:11', 6, 'true');
INSERT INTO `article` VALUES (22, '托洛茨基的最后时间', '<p> 托洛茨基第三国际</p>', '', '已发布', 15, 3, '2024-12-30 14:59:32', '2025-01-08 15:01:16', 0, 'true');
INSERT INTO `article` VALUES (23, '莫高窟', '<p> 方可客服姐姐覅</p>', '', '审核中', 8, 3, '2024-12-30 14:59:41', '2024-12-30 14:59:41', 0, 'true');
INSERT INTO `article` VALUES (24, '太阳的眼睛', '<p> fejijeijfief</p>', '', '已发布', 16, 11, '2024-12-30 16:06:29', '2024-12-30 16:11:36', 1, 'true');
INSERT INTO `article` VALUES (25, 'duehduhuedh', '<p> 2005021837</p>', '', '已发布', 16, 11, '2024-12-30 16:06:41', '2024-12-30 16:11:42', 1, 'true');
INSERT INTO `article` VALUES (26, 'dhhd', '<p> djidjwd、</p>', '', '已发布', 16, 11, '2024-12-30 16:06:49', '2024-12-30 16:11:44', 2, 'true');
INSERT INTO `article` VALUES (27, '美好', '<p> deodo</p>', '', '已发布', 16, 11, '2024-12-30 16:06:57', '2024-12-30 16:11:46', 1, 'true');
INSERT INTO `article` VALUES (28, '养猫心得', '<p> fjeijifjeiofo</p>', '', '已发布', 17, 12, '2024-12-30 16:08:25', '2024-12-30 16:11:49', 2, 'true');
INSERT INTO `article` VALUES (29, '狗粮的谨慎', '<p> 的积分覅UFO而房价</p>', '', '已发布', 17, 12, '2024-12-30 16:08:37', '2024-12-30 16:11:51', 3, 'true');
INSERT INTO `article` VALUES (30, '猫品种有贵贱？', '<p> 的就覅金额覅文件</p>', '', '已发布', 17, 12, '2024-12-30 16:08:57', '2024-12-30 16:11:53', 1, 'true');
INSERT INTO `article` VALUES (31, '修心不是好脾气', '<p> 的地接费点击分解</p>', '', '已发布', 18, 13, '2024-12-30 16:10:29', '2024-12-30 16:11:55', 0, 'true');
INSERT INTO `article` VALUES (32, '忍辱的误区', '<p> 欸积分卡富婆而非看看</p>', '', '已发布', 18, 13, '2024-12-30 16:10:49', '2024-12-30 16:11:57', 2, 'true');
INSERT INTO `article` VALUES (33, '劝大家读读博弈论', '<p> 等会我iu降低我决定离开酒店</p>', '', '已发布', 18, 13, '2024-12-30 16:11:17', '2024-12-30 16:11:59', 0, 'true');
INSERT INTO `article` VALUES (34, '我的文章2', '<p>我拍的peek</p>', '', '已发布', 16, 11, '2024-12-30 16:31:42', '2024-12-30 16:32:48', 0, 'true');
INSERT INTO `article` VALUES (35, '我的文章333', '<p> grkkgorkog</p>', '', '已发布', 16, 11, '2024-12-30 16:34:31', '2024-12-30 16:35:35', 1, 'true');
INSERT INTO `article` VALUES (36, '罗马帝国消亡史', '<p> 斤斤计较急急急急急急急急急急急急急急急</p>', '', '审核中', 5, 3, '2024-12-30 19:46:02', '2024-12-30 19:46:02', 0, 'true');
INSERT INTO `article` VALUES (37, '白起', '<p> 从覅昆明v哦i附件gov们尽快让法国v</p>', '', '草稿', 19, 3, '2024-12-30 20:03:26', '2024-12-30 20:03:26', 0, 'true');
INSERT INTO `article` VALUES (38, '耶耶耶', '<p> 的基础今日飞机</p>', '', '草稿', 11, 3, '2024-12-30 20:20:51', '2024-12-30 20:20:51', 0, 'false');
INSERT INTO `article` VALUES (39, '西餐', '<p> 方可免费发</p>', '', '草稿', 21, 3, '2024-12-30 20:27:24', '2024-12-30 20:27:24', 0, 'false');
INSERT INTO `article` VALUES (40, '中餐', '<p> 方可我佩服敬佩</p>', '', '草稿', 21, 3, '2024-12-30 20:27:38', '2024-12-30 20:27:38', 0, 'false');
INSERT INTO `article` VALUES (41, '元朝公主', '<p> 的纷纷</p>', '', '已发布', 5, 3, '2024-12-31 09:53:33', '2025-01-01 18:00:19', 9, 'false');
INSERT INTO `article` VALUES (42, '猫咪掉毛怎么办', '<p> 如发热发热我国</p>', '', '已发布', 17, 12, '2025-01-01 17:59:24', '2025-01-01 18:00:21', 5, 'true');
INSERT INTO `article` VALUES (43, 'Faker打野教程', '<p> 结婚登记复活节活动结束访华快速打击腐败</p>', '', '已发布', 23, 17, '2025-01-01 21:09:17', '2025-01-01 21:09:34', 9, 'true');
INSERT INTO `article` VALUES (44, '孩子们我没有离去', '<p> man</p>', '', '已发布', 24, 18, '2025-01-01 22:13:49', '2025-01-01 22:14:05', 4, 'true');
INSERT INTO `article` VALUES (45, '人工智能的最新成果', '<p>       近年来，人工智能（AI）技术取得了显著进展，尤其是在自然语言处理、图像识别、自动驾驶和生成模型等领域。随着深度学习算法的不断发展和硬件性能的提升，人工智能已经渗透到各个行业，改变了我们的工作和生活方式。AI不仅提高了工作效率，还推动了新兴技术和产业的崛起，为我们带来了前所未有的机遇和挑战。</p><p>       自然语言处理（NLP）方面，基于大规模预训练模型的技术已经取得了重要突破，尤其是OpenAI的GPT系列模型。GPT-4等模型在文本生成、情感分析和语义理解等方面表现出色，能够生成更加连贯、自然的文本，并能够处理复杂的语言任务。这些技术的进步不仅使得机器翻译和智能客服变得更加高效，还在医疗、金融、法律等领域为专业人员提供了有力的支持。AI可以帮助分析大量的文本数据，提取有价值的信息，辅助决策，减少人工错误。</p><p>       图像识别技术也取得了重大突破。随着卷积神经网络（CNN）等深度学习技术的发展，AI在图像分类、人脸识别、目标检测等领域的准确率大幅提高，特别是在医疗影像分析中，AI已能够辅助医生诊断癌症、心脏病等疾病。AI在自动生成图像方面也取得了显著进展，生成对抗网络（GAN）使得AI能够根据用户的需求生成高度真实的图像或视频，这为广告、娱乐和艺术创作提供了新的可能。通过这种技术，AI能够创作出以前无法想象的艺术作品，甚至能够重现已经消失的艺术风格或人物形象。</p><p>       自动驾驶技术是人工智能最具革命性的应用之一。随着传感器技术和深度学习算法的进步，自动驾驶汽车已经能够较为准确地感知周围环境，做出智能决策，确保驾驶安全。尽管技术尚在不断发展，自动驾驶仍面临着技术、法律和伦理等挑战，但各大科技公司和汽车制造商的研发已经取得了令人瞩目的成果。未来，自动驾驶可能会彻底改变交通运输的方式，减少交通事故，提高道路安全，优化资源利用。</p><p>        此外，AI在创意产业的应用也令人兴奋。人工智能的生成内容技术（AIGC）正在改变艺术创作的方式。通过分析大量数据，AI能够创作出风格独特的艺术作品、音乐和文学作品。像OpenAI的DALL·E和Google的DeepMind等技术，能够根据用户的文本描述生成精美的图像，甚至是完全原创的艺术作品。在音乐领域，AI能够理解不同的旋律和节奏模式，创作符合特定风格的音乐。在文学创作方面，AI也能够生成具有文学价值的作品，如诗歌、短篇小说等，这为艺术创作者提供了新的灵感和创作工具。</p><p>       然而，随着人工智能技术的广泛应用，关于其带来的伦理和法律问题也开始浮现。如何保证数据隐私和安全、如何避免AI产生的偏见、以及如何合理监管AI的应用，已经成为我们必须面对的问题。随着AI在各领域的深入应用，社会将需要制定相应的政策和法律框架，确保技术的发展能够造福全人类。</p><p>       人工智能的最新成果已经在许多领域产生了深远的影响，从提高工作效率到推动创新，AI正在改变我们的社会结构和生活方式。尽管面临各种挑战，人工智能的未来仍充满希望。随着技术的不断进步，AI将在未来发挥越来越重要的作用，助力人类迈向更加智能和高效的未来。</p>', '', '已发布', 26, 12, '2025-01-03 14:27:41', '2025-01-03 14:28:46', 4, 'true');
INSERT INTO `article` VALUES (46, '惊了！DeepSeek-V2悄然崛起，AI领域的黑马！', '<p> 2024年5月15日，字节宣布其主力AI大模型的定价为输入0.0008元/千tokens（0.8元/百万tokens），当时称较行业便宜99.3%。</p><p>5月21日，阿里云宣布，通义千问对标ChatGPT-4的主力模型Qwen-Long，API输入价格从0.02元/千tokens（20元/百万tokens）降至0.0005元/千tokens（0.5元/百万tokens），直降97%。</p><p>百度随之公告，文心大模型的两款入门级主力模型ENIRE Speed、ENIRE Lite全面免费。</p><p>此前，智谱AI入门级产品GLM-3 Turbo模型的调用价格也从5元/百万tokens降至1元/百万tokens。</p><p>而引领这一趋势的事件，正是5月6日， DeepSeek发布全新第二代MoE模型DeepSeek-V2，并宣布自身的API定价为每百万tokens输入1元、输出2元，这一价格显著低于当前市场上的其他同类产品，仅为GPT-4-Turbo价格的近百分之一。</p><p>5月15日，DeepSeek完成备案正式开放服务，之后国内AI大模型公司纷纷加入大幅降价行列。</p><p>DeepSeek这家从未在市场融资的神秘大模型公司一跃成名。</p><p class=\"ql-align-center\"><img src=\"https://n.sinaimg.cn/sinakd20240806s/523/w845h478/20240806/be0b-f207a41b2360f4bec82af8a47510572b.jpg\"></p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><strong><img src=\"https://n.sinaimg.cn/sinakd20240806s/418/w1080h138/20240806/adde-ed574cc1eb916c901a7738cca16e68df.png\"></strong></p><p class=\"ql-align-center\"><strong>成立背景和核心理念</strong></p><p>DeepSeek（杭州深度求索人工智能基础技术研究有限公司，本文简称“DeepSeek”）由梁文锋创立，他在DeepSeek最终受益的股份比例超80%（根据天眼查数据）。</p><p class=\"ql-align-center\"><br></p><p><strong>梁文锋是幻方量化的实际控制人，幻方量化是国内量化私募领域的巨头之一，管理规模曾一度飙升至千亿，现在管理规模依然在600亿元左右。</strong></p><p class=\"ql-align-center\"><img src=\"https://n.sinaimg.cn/sinakd20240806s/36/w535h301/20240806/a952-cbda290ee9c42bd58ad74414bf6b55df.jpg\"></p><p>DeepSeek的创立，源于梁文峰在幻方量化时期即对AI的热衷。</p><p>2019年，其自研的深度学习训练平台「萤火一号」总投资近2亿元，搭载了1100块GPU；两年后，「萤火二号」的投入增加到10亿元，搭载了约1万张英伟达A100显卡。</p><p>背靠幻方，DeepSeek第一期研发投入即为幻方自主出资，同时有“萤火超算”万卡级别的算力支持，单从资金及硬件配置上，DeepSeek在初期远比国内大部分AI初创企业优渥。</p><p>使得DeepSeek是国内除了互联网大厂之外少有的能够拥有超过1万张英伟达A100显卡的人工智能公司。</p><p><strong>（1）要原创不要模仿</strong></p><blockquote>随着经济发展，中国也要逐步成为贡献者，而不是一直搭便车。DeepSeek要以创新贡献者的身份，加入到游戏里去。</blockquote><p>—— 梁文峰曾这样解释DeepSeek的初衷。</p><p>DeepSeek的中文翻译为“深度求索”，这反映了公司的定位与目标。</p><p>DeepSeek没有选择“1→10”而逆向选择了“0→1”，其提出了一种崭新的MLA（一种新的多头潜在注意力机制）架构，是DeepSeek对模型架构进行了全方位创新。</p><p class=\"ql-align-center\"><img src=\"https://n.sinaimg.cn/sinakd20240806s/246/w1023h823/20240806/eed7-019f714d5bbd38e08ece4fab8f77287f.jpg\"></p><p>也正是这种独特架构，其把显存占用降到了过去最常用的MHA架构的5%-13%，同时，它独创的DeepSeekMoESparse结构，也把计算量降到极致，所有这些最终促成了成本的下降，宣布了行业震惊的定价方案，并引领了大模型降价潮。</p><p><strong>（2）首要创新，暂不考虑商业化</strong></p><p>梁文峰曾表示：</p><p>创新首先是一个信念问题。</p><p>DeepSeek是国内少数专注研究和技术的AI大模型公司，也是唯一一家未全面考虑商业化，甚至没有进行融资的公司。</p><p>DeepSeek希望形成一种生态，业界直接使用DeepSeek的技术和产出，DeepSeek只负责基础模型和前沿的创新，然后其它公司在DeepSeek的基础上构建toB、toC的业务。</p><p><strong>（3）本土人才撑起研发</strong></p><p>与其他AI企业执着地去海外挖人不同，DeepSeek热衷于自身培养。</p><p>DeepSeek的团队成员包括来自顶尖高校的应届毕业生、博四、博五实习生以及毕业几年的年轻人，他们对研究充满热情和好奇心。</p><p>梁文峰表示：“前50名顶尖人才可能不在中国，但也许我们能自己打造这样的人。”</p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><strong>团队构成与专业背景</strong></p><p><strong>（1）创始人——梁文锋</strong></p><p>梁文锋，深度求索创始人、幻方量化创始人。</p><p>他本硕就读于浙江大学，攻读人工智能，念书时就笃定“AI定会改变世界”。</p><p>&nbsp;毕业后，梁文锋没有走程序员的既定路线，而是下场做量化投资，成立幻方量化。幻方量化成立仅6年管理规模即曾达到千亿，被称为“量化四大天王”之一。</p><p><strong>（2）团队构成</strong></p><p>OpenAI前政策主管、Anthropic联合创始人Jack Clark认为，DeepSeek“雇佣了一批高深莫测的奇才”。</p><p>DeepSeek的团队成员包括来自顶尖高校的应届毕业生、博四、博五实习生以及毕业几年的年轻人，但是具体是谁，我们不得而知。</p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><strong>模型介绍</strong></p><p>立足于开源，DeepSeek认为先有一个强大的技术生态更重要。</p><p><strong>在颠覆性的技术面前，闭源形成的护城河是短暂的。DeepSeek的护城河来自在研发过程中团队的成长及经验的积累。</strong></p><p>目前DeepSeek的模型全部开源，包括通用大模型DeepSeek LLM、MoE模型DeepSeek MoE、DeepSeek V2、代码模型DeepSeek Coder、DeepSeek Coder V2、数学模型DeepSeek Math、多模态大模型DeepSeek VL。</p><p class=\"ql-align-center\"><br></p><p>DeepSeek 的 GitHub 页面</p><p><strong>（1）MoE模型DeepSeek-V2</strong></p><p>2024年1月，DeepSeek发布并开源国内首个MoE大模型 DeepSeekMoE。</p><p>2024年5月， DeepSeek发布并开源第二代MoE模型DeepSeek-V2。</p><p>DeepSeek-V2是一个混合专家 (MoE) 语言模型，具有训练经济、推理高效的特点。它包含 236B 总参数，其中每个 token 激活 21B，支持 128K tokens 的上下文长度。</p><p class=\"ql-align-center\"><img src=\"https://n.sinaimg.cn/sinakd20240806s/471/w730h541/20240806/96ec-9601c5a603b264e2e6de1a9906f96818.jpg\"></p><p>DeepSeek-V2没有沿用主流的“类LLaMA的Dense结构”和“类Mistral的Sparse结构”，而是对模型框架进行了全方位的创新，提出了媲美MHA的MLA架构，大幅减少计算量和推理显存；自研Sparse结构DeepSeekMoE进一步将计算量降低到极致，两者结合最终实现模型性能跨级别的提升。</p><p>与 DeepSeek 67B 相比，DeepSeek-V2 实现了显著增强的性能，同时节省了 42.5% 的训练成本、减少了 93.3% 的 KV 缓存、并将最大生成吞吐量提升至 5.76 倍。</p><p>与发布时的模型对比，DeepSeek-V2均表现出色。</p><p>中文综合能力（AlignBench）开源模型中最强，与GPT-4-Turbo，文心4.0等闭源模型在评测中处于同一梯队。</p><p>英文综合能力（MT-Bench）与最强的开源模型LLaMA3-70B同处第一梯队，超过最强MoE开源模型Mixtral 8x22B。（根据DeepSeek发布同期披露评测数据）</p><p class=\"ql-align-center\"><img src=\"https://n.sinaimg.cn/sinakd20240806s/793/w873h720/20240806/c09a-e40b62afb730dba9e670c2a78d75bfd8.jpg\"></p><p>在 LMSYS 盲测竞技场最新排名中，DeepSeek-V2总榜排名世界模型第17，排于其前面的仅有OpenAI、Anthropic、Google、Meta、NexusFlow、零一万物的大模型。</p><p>在Meta-Llama-3.1开源之前，DeepSeek-V2是全球开源模型第一位。</p><p>LMSYS 盲测竞技场总榜：</p><p class=\"ql-align-center\"><br></p><p>价格</p><p>DeepSeek-V2 API的定价为：每百万tokens输入1元、输出2元</p><p>最新启用了上下文硬盘缓存技术，把预计未来会重复使用的内容，缓存在分布式的硬盘阵列中。如果输入存在重复，则重复的部分只需要从缓存读取，无需计算。缓存命中的部分，DeepSeek 费用为 0.1元 每百万 tokens。</p><p class=\"ql-align-center\"><img src=\"https://n.sinaimg.cn/sinakd20240806s/651/w1080h371/20240806/8a26-a458289af47eb0bb999bb87d4680bf20.jpg\"></p><p><strong>（2）通用大模型DeepSeek LLM</strong></p><p>2023年11月，DeepSeek 发布并开源通用大语言模型DeepSeek LLM，是DeepSeek继DeepSeek Coder后发布的第二款模型。</p><p>同时开源 7B 和 67B 的两种规模模型，均含基础模型（base）和指令微调模型（chat）。</p><p>相比当时开源的同级别模型 LLaMA2 70B，DeepSeek LLM 67B 在近20个中英文的公开评测榜单上表现更佳。尤其突出的是推理、数学、编程等能力（如：HumanEval、MATH、CEval、CMMLU）。</p><p><strong>（3）代码领域模型DeepSeek CoderV2</strong></p><p>2023年11月，DeepSeek发布并开源他们首款模型，代码模型 DeepSeek-Coder。</p><p>2024年6月，DeepSeek发布并开源代码模型DeepSeek-Coder-V2。DeepSeek-Coder-V2包含236B与16B两种参数规模，对编程语言的支持从86种扩展到338种。</p><p>DeepSeek-Coder-V2 沿用 DeepSeek-V2 的模型结构，总参数 236B，激活 21B，发布时在代码、数学的多个榜单上位居全球第二，介于最强闭源模型 GPT-4o 和 GPT-4-Turbo 之间。（根据DeepSeek发布同期披露评测数据）</p><p class=\"ql-align-center\"><br></p><p>DeepSeek-Coder-V2 还具有良好的通用性能，发布时在中英通用能力上位列国内第一梯队。（根据DeepSeek发布同期披露评测数据）</p><p class=\"ql-align-center\"><br></p><p><strong>（4）多模态大模型DeepSeek VL</strong></p><p>2024年3月，DeepSeek发布并开源多模态大模型DeepSeek VL。同时开源 7B与1.3B的两种规模模型。</p><p>DeepSeek-VL 7B超越同规模（7B 参数）的 EMU2-Chat/Yi-VL 等模型，甚至超过更大规模（17B 参数）的 CogVLM</p><p>DeepSeek-VL在不丢失语言能力的情况下融入多模态能力，能够对绝大多数现实场景下的问题给出细致而有条理的回复。</p><p class=\"ql-align-center\"><img src=\"https://n.sinaimg.cn/sinakd20240806s/183/w1080h703/20240806/93dc-df52557a1136875b9c36463cf18181c4.jpg\"></p><p>能够接受大尺寸分辨率图片作为输入，高达1024x1024，识别图片中的细小物体。同时具备通用多模式理解能力，能够处理逻辑图、网页、公式识别、科学文献、自然图像，以及在复杂场景中体现智能。</p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\">小结</p><p>国内不少公司习惯于跟随海外科技公司，参考技术做应用变现。即使是互联网大厂在创新方面也较为谨慎，更加重视应用层面。</p><p><strong>DeepSeek逆向而行，在这一波AI大模型的发展浪潮中展现出了更为积极进取的姿态。</strong></p><p>DeepSeek不再满足于仅仅成为一个跟随者，而是选择站在技术创新的前端，从架构到模型参与整个AI大模型行业的进程，“要原创，要创新”。</p><p><strong>在AI大模型架构层面，创新型提出了MLA架构，并取得了卓越的成绩。</strong></p><p>我们非常认同DeepSeek创始人梁立峰关于“中国不可能永远只做模仿”的观点，我们期待DeepSeek在创新的道路上行稳致远，也期待更多的中国公司加入创新的行业。</p>', '', '已发布', 26, 12, '2025-01-03 14:35:24', '2025-01-03 15:04:50', 12, 'true');
INSERT INTO `article` VALUES (47, '人工智能：让机器“思考”背后的奥秘', '<p> </p><p>   你有没有想过，智能手机上的语音助手、推荐系统、自动驾驶汽车，甚至是像聊天机器人一样的人工智能，背后是如何“思考”的？今天，我们就来一起解开人工智能的神秘面纱，看看机器是如何像人一样“思考”和“学习”的。</p><p><br></p><p>一、人工智能是什么？</p><p>人工智能（AI）是指让计算机系统模拟人类的思维过程，从而完成通常需要人类智能的任务。我们说一个系统是“智能的”，通常是因为它能像人类一样做出决策、理解语音、识别图像、学习新事物并解决问题。</p><p><br></p><p>这些看似神奇的能力，其实背后有着一套复杂的原理和技术。人工智能的核心，就是模仿人类大脑如何处理信息。我们的大脑通过神经元相互连接传递信息，而人工智能则是通过一种叫做“神经网络”的技术来模仿这一过程。</p><p><br></p><p>二、神经网络：仿生的大脑</p><p>想象一下，我们的大脑中有数百亿个神经元，每个神经元之间通过突触连接，传递信号。当我们看到一个物体时，神经元会激活，帮助我们识别并做出反应。人工智能中的神经网络就是用来模仿这种行为的。</p><p><br></p><p>神经网络由许多个“神经元”组成，这些神经元通过“连接权重”相互传递信息。每个神经元会根据接收到的信号进行计算，并决定是否激活。这些神经元层层相连，构成了一个深度的“网络”。就像人类大脑通过感知和经验不断调整神经元连接的强度，人工智能的神经网络也会通过不断的训练来调整权重，使得它在处理信息时变得更加“聪明”。</p><p><br></p><p>三、深度学习：让机器拥有“学习”能力</p><p>你一定听说过“深度学习”这个词，它是目前最热门的人工智能技术之一。深度学习是基于深度神经网络的一种学习方法，能够让机器从大量数据中“学习”并自动优化自己的性能。</p><p><br></p><p>假设你要教人工智能如何识别猫和狗。你给它成千上万张猫和狗的照片，让它通过这些数据进行训练。在训练的过程中，神经网络会自动调整自己的连接权重，逐渐学习到猫和狗之间的区别：猫的耳朵尖、狗的鼻子短，等等。通过不断的学习和优化，最终，人工智能能够准确地分辨出照片中的猫和狗。</p><p><br></p><p>这种学习的过程被称为“训练”。深度学习通过反复训练神经网络，使得机器能够从大量数据中发现规律，并不断提高预测和判断的准确性。</p><p><br></p><p>四、机器学习：让机器变得更加“聪明”</p><p>深度学习是机器学习的一部分，而机器学习则是人工智能的一项基础技术。机器学习的目标是让机器通过经验（数据）自动改进其算法，从而在没有显式编程的情况下“学习”完成任务。</p><p><br></p><p>你可以把机器学习想象成一个学生，初学时它并不了解某个问题的答案，但通过不断做题（即接受数据并进行计算），它逐渐掌握了规律和方法。就像你通过做数学题学会解题一样，机器通过不断接触数据并进行学习，最终能够在新问题面前作出合理的判断。</p><p><br></p><p>例如，推荐系统就是机器学习的典型应用。比如，你在一个视频平台上观看了一些科技相关的视频，推荐算法就会根据你观看的历史记录和其他用户的行为，学习出你可能喜欢的其他视频，并把这些视频推荐给你。这一切并不是人工编写规则，而是通过数据让机器自动学习和预测。</p><p><br></p><p>五、自然语言处理：让机器懂得“语言”</p><p>你一定和智能语音助手打过交道，像Siri、Alexa、百度语音助手等，它们能理解你说的话并做出响应。这背后的技术就是“自然语言处理”（NLP）。</p><p><br></p><p>自然语言处理的目标是让计算机能够理解、分析、生成和处理人类语言。它不仅要识别出句子中的每个词，还要理解词语之间的关系和上下文。比如，当你说“明天的天气如何？”时，语音助手不仅要识别出“天气”这一词，还需要理解“明天”的含义，才能正确回答你。</p><p><br></p><p>NLP的一个关键技术就是“语义分析”，即分析句子中的每个词的含义，并理解它们的相互关系。这需要机器能够通过大量的文本数据进行训练，逐渐学会如何理解和生成自然语言。</p><p><br></p><p>六、人工智能的应用：从生活到未来</p><p>人工智能的应用几乎覆盖了我们生活的方方面面。你在社交媒体上看到的内容推荐、在线购物时的商品推荐、自动驾驶汽车、医疗影像的诊断、甚至智能客服和虚拟助手，都是人工智能技术的产物。</p><p><br></p><p>例如，自动驾驶汽车通过人工智能感知周围环境、识别路标、避开障碍物，并做出驾驶决策。医疗领域中，AI能够通过分析大量的医疗影像，帮助医生诊断病情，甚至发现一些人眼难以察觉的病变。</p><p><br></p><p>随着技术的不断发展，人工智能将在更多领域大展身手，它不仅能帮助我们提高工作效率，甚至可能改变我们的生活方式。</p><p><br></p><p>七、人工智能的未来：机遇与挑战</p><p>人工智能的未来充满了无限可能。然而，它的发展也面临一些挑战，比如伦理问题、隐私保护和技术滥用等。如何确保人工智能的应用是安全的、公正的，并且能够为全社会带来福祉，是我们必须思考的问题。</p><p><br></p><p>总的来说，人工智能正在从“科幻”走向“现实”，并逐步进入到我们日常生活的每一个角落。它不仅是技术的创新，更是我们对“智能”理解的突破。随着人工智能不断“成长”，我们也将迎来更加智慧的未来。</p><p><br></p><p>通过这些原理和技术的结合，人工智能正在变得越来越“聪明”，它不再仅仅是机械地执行任务，而是能够通过学习不断优化自己的表现。未来的世界，或许会因为这些“会思考”的机器而变得更加精彩。</p>', '', '草稿', 26, 12, '2025-01-03 16:14:32', '2025-01-03 16:14:32', 0, 'true');
INSERT INTO `article` VALUES (48, '中国莫高窟的艺术', '<p> 莫高窟位于甘肃省。</p>', '', '审核未通过', 28, 3, '2025-01-07 16:47:03', '2025-01-08 09:50:52', 1, 'true');

-- ----------------------------
-- Table structure for articledata
-- ----------------------------
DROP TABLE IF EXISTS `articledata`;
CREATE TABLE `articledata`  (
  `id` int unsigned NOT NULL,
  `articleid` int unsigned,
  `time` date DEFAULT NULL,
  `browse` int unsigned,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `articleid`(`articleid`) USING BTREE,
  CONSTRAINT `articledata_ibfk_1` FOREIGN KEY (`articleid`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1331 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of articledata
-- ----------------------------
INSERT INTO `articledata` VALUES (1, 14, '2024-12-26', 10);
INSERT INTO `articledata` VALUES (2, 9, '2024-12-04', 4);
INSERT INTO `articledata` VALUES (3, 10, '2024-12-06', 4);
INSERT INTO `articledata` VALUES (4, 11, '2024-12-08', 4);
INSERT INTO `articledata` VALUES (5, 8, '2024-12-10', 4);
INSERT INTO `articledata` VALUES (6, 12, '2024-12-05', 4);
INSERT INTO `articledata` VALUES (7, 7, '2024-12-07', 4);
INSERT INTO `articledata` VALUES (8, 9, '2024-12-11', 4);
INSERT INTO `articledata` VALUES (9, 13, '2024-12-12', 4);
INSERT INTO `articledata` VALUES (10, 10, '2024-12-14', 4);
INSERT INTO `articledata` VALUES (11, 11, '2024-12-13', 4);
INSERT INTO `articledata` VALUES (12, 12, '2024-12-15', 4);
INSERT INTO `articledata` VALUES (13, 8, '2024-12-09', 4);
INSERT INTO `articledata` VALUES (14, 13, '2024-12-16', 4);
INSERT INTO `articledata` VALUES (15, 7, '2024-12-17', 4);
INSERT INTO `articledata` VALUES (16, 9, '2024-12-18', 4);
INSERT INTO `articledata` VALUES (17, 10, '2024-12-19', 4);
INSERT INTO `articledata` VALUES (18, 8, '2024-12-20', 4);
INSERT INTO `articledata` VALUES (19, 12, '2024-12-21', 4);
INSERT INTO `articledata` VALUES (20, 13, '2024-12-22', 4);
INSERT INTO `articledata` VALUES (21, 7, '2024-12-23', 4);
INSERT INTO `articledata` VALUES (22, 11, '2024-12-24', 4);
INSERT INTO `articledata` VALUES (23, 10, '2024-12-25', 4);
INSERT INTO `articledata` VALUES (24, 9, '2024-12-03', 1);
INSERT INTO `articledata` VALUES (25, 8, '2024-12-04', 1);
INSERT INTO `articledata` VALUES (26, 12, '2024-12-06', 1);
INSERT INTO `articledata` VALUES (27, 7, '2024-12-08', 1);
INSERT INTO `articledata` VALUES (28, 13, '2024-12-10', 1);
INSERT INTO `articledata` VALUES (29, 11, '2024-12-11', 1);
INSERT INTO `articledata` VALUES (30, 10, '2024-12-12', 1);
INSERT INTO `articledata` VALUES (31, 12, '2024-12-14', 1);
INSERT INTO `articledata` VALUES (32, 9, '2024-12-17', 1);
INSERT INTO `articledata` VALUES (33, 4, '2024-12-26', 8);
INSERT INTO `articledata` VALUES (34, 5, '2024-12-27', 4);
INSERT INTO `articledata` VALUES (35, 6, '2024-12-26', 16);
INSERT INTO `articledata` VALUES (36, 7, '2024-12-26', 8);
INSERT INTO `articledata` VALUES (37, 8, '2024-12-26', 12);
INSERT INTO `articledata` VALUES (38, 9, '2024-12-26', 20);
INSERT INTO `articledata` VALUES (39, 10, '2024-12-26', 8);
INSERT INTO `articledata` VALUES (40, 11, '2024-12-26', 36);
INSERT INTO `articledata` VALUES (41, 12, '2024-12-26', 8);
INSERT INTO `articledata` VALUES (42, 13, '2024-12-25', 4);
INSERT INTO `articledata` VALUES (43, 1, '2024-12-26', 0);
INSERT INTO `articledata` VALUES (44, 3, '2024-12-26', 0);
INSERT INTO `articledata` VALUES (45, 4, '2024-12-27', 0);
INSERT INTO `articledata` VALUES (46, 5, '2024-12-26', 0);
INSERT INTO `articledata` VALUES (47, 6, '2024-12-27', 0);
INSERT INTO `articledata` VALUES (48, 7, '2024-12-27', 0);
INSERT INTO `articledata` VALUES (49, 8, '2024-12-27', 0);
INSERT INTO `articledata` VALUES (50, 9, '2024-12-27', 0);
INSERT INTO `articledata` VALUES (51, 10, '2024-12-27', 0);
INSERT INTO `articledata` VALUES (52, 11, '2024-12-27', 0);
INSERT INTO `articledata` VALUES (53, 12, '2024-12-27', 0);
INSERT INTO `articledata` VALUES (54, 13, '2024-12-26', 0);
INSERT INTO `articledata` VALUES (55, 14, '2024-12-27', 0);
INSERT INTO `articledata` VALUES (56, 15, '2024-12-26', 0);
INSERT INTO `articledata` VALUES (57, 16, '2024-12-26', 0);
INSERT INTO `articledata` VALUES (58, 15, '2024-12-27', 15);
INSERT INTO `articledata` VALUES (59, 16, '2024-12-27', 38);
INSERT INTO `articledata` VALUES (60, 14, '2024-12-30', 2);
INSERT INTO `articledata` VALUES (61, 13, '2024-12-30', 2);
INSERT INTO `articledata` VALUES (62, 24, '2024-12-30', 1);
INSERT INTO `articledata` VALUES (63, 1, '2024-12-30', 20);
INSERT INTO `articledata` VALUES (64, 24, '2024-12-30', 130);
INSERT INTO `articledata` VALUES (65, 28, '2024-12-30', 50);
INSERT INTO `articledata` VALUES (66, 33, '2024-12-30', 36);
INSERT INTO `articledata` VALUES (67, 6, '2025-01-01', 4);
INSERT INTO `articledata` VALUES (68, 42, '2025-01-01', 2);
INSERT INTO `articledata` VALUES (69, 41, '2025-01-01', 7);
INSERT INTO `articledata` VALUES (70, 21, '2025-01-01', 2);
INSERT INTO `articledata` VALUES (71, 16, '2025-01-01', 1);
INSERT INTO `articledata` VALUES (72, 15, '2025-01-01', 1);
INSERT INTO `articledata` VALUES (73, 14, '2025-01-01', 2);
INSERT INTO `articledata` VALUES (74, 13, '2025-01-01', 2);
INSERT INTO `articledata` VALUES (75, 5, '2025-01-01', 1);
INSERT INTO `articledata` VALUES (76, 4, '2025-01-01', 1);
INSERT INTO `articledata` VALUES (77, 7, '2025-01-01', 2);
INSERT INTO `articledata` VALUES (78, 8, '2025-01-01', 1);
INSERT INTO `articledata` VALUES (79, 35, '2025-01-01', 1);
INSERT INTO `articledata` VALUES (80, 43, '2025-01-01', 8);
INSERT INTO `articledata` VALUES (81, 1, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (82, 3, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (83, 4, '2025-01-03', 3);
INSERT INTO `articledata` VALUES (84, 5, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (85, 6, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (86, 7, '2025-01-03', 1);
INSERT INTO `articledata` VALUES (87, 8, '2025-01-03', 1);
INSERT INTO `articledata` VALUES (88, 9, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (89, 10, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (90, 11, '2025-01-03', 1);
INSERT INTO `articledata` VALUES (91, 12, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (92, 13, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (93, 14, '2025-01-03', 1);
INSERT INTO `articledata` VALUES (94, 15, '2025-01-03', 1);
INSERT INTO `articledata` VALUES (95, 16, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (96, 19, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (97, 21, '2025-01-03', 1);
INSERT INTO `articledata` VALUES (98, 22, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (99, 23, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (100, 36, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (101, 37, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (102, 38, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (103, 39, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (104, 40, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (105, 41, '2025-01-03', 1);
INSERT INTO `articledata` VALUES (106, 18, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (107, 24, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (108, 25, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (109, 26, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (110, 27, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (111, 34, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (112, 35, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (113, 28, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (114, 29, '2025-01-03', 2);
INSERT INTO `articledata` VALUES (115, 30, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (116, 42, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (117, 31, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (118, 32, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (119, 33, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (120, 43, '2025-01-03', 0);
INSERT INTO `articledata` VALUES (121, 44, '2025-01-03', 2);
INSERT INTO `articledata` VALUES (144, 4, '2025-01-02', 1);
INSERT INTO `articledata` VALUES (145, 4, '2024-12-31', 1);
INSERT INTO `articledata` VALUES (146, 4, '2024-12-30', 1);
INSERT INTO `articledata` VALUES (147, 4, '2024-12-29', 1);
INSERT INTO `articledata` VALUES (148, 5, '2025-01-02', 0);
INSERT INTO `articledata` VALUES (149, 5, '2024-12-31', 0);
INSERT INTO `articledata` VALUES (152, 5, '2024-12-30', 0);
INSERT INTO `articledata` VALUES (153, 5, '2024-12-29', 0);
INSERT INTO `articledata` VALUES (154, 6, '2025-01-02', 0);
INSERT INTO `articledata` VALUES (155, 6, '2024-12-31', 0);
INSERT INTO `articledata` VALUES (156, 6, '2024-12-30', 0);
INSERT INTO `articledata` VALUES (157, 6, '2024-12-29', 0);
INSERT INTO `articledata` VALUES (158, 7, '2025-01-02', 0);
INSERT INTO `articledata` VALUES (159, 7, '2024-12-31', 0);
INSERT INTO `articledata` VALUES (160, 7, '2024-12-30', 0);
INSERT INTO `articledata` VALUES (161, 7, '2024-12-29', 0);
INSERT INTO `articledata` VALUES (162, 8, '2025-01-02', 0);
INSERT INTO `articledata` VALUES (163, 8, '2024-12-31', 0);
INSERT INTO `articledata` VALUES (164, 8, '2024-12-30', 0);
INSERT INTO `articledata` VALUES (165, 8, '2024-12-29', 0);
INSERT INTO `articledata` VALUES (166, 9, '2025-01-02', 0);
INSERT INTO `articledata` VALUES (167, 9, '2025-01-01', 1);
INSERT INTO `articledata` VALUES (168, 9, '2024-12-31', 0);
INSERT INTO `articledata` VALUES (169, 9, '2024-12-30', 0);
INSERT INTO `articledata` VALUES (170, 9, '2024-12-29', 0);
INSERT INTO `articledata` VALUES (171, 10, '2025-01-02', 32);
INSERT INTO `articledata` VALUES (172, 10, '2025-01-01', 1);
INSERT INTO `articledata` VALUES (173, 10, '2024-12-31', 8);
INSERT INTO `articledata` VALUES (174, 10, '2024-12-30', 4);
INSERT INTO `articledata` VALUES (175, 10, '2024-12-29', 8);
INSERT INTO `articledata` VALUES (176, 11, '2025-01-02', 456);
INSERT INTO `articledata` VALUES (177, 11, '2025-01-01', 88);
INSERT INTO `articledata` VALUES (178, 11, '2024-12-31', 76);
INSERT INTO `articledata` VALUES (179, 11, '2024-12-30', 23);
INSERT INTO `articledata` VALUES (180, 11, '2024-12-29', 8);
INSERT INTO `articledata` VALUES (181, 12, '2025-01-02', 6);
INSERT INTO `articledata` VALUES (182, 12, '2025-01-01', 0);
INSERT INTO `articledata` VALUES (183, 12, '2024-12-31', 0);
INSERT INTO `articledata` VALUES (184, 12, '2024-12-30', 0);
INSERT INTO `articledata` VALUES (185, 12, '2024-12-29', 8);
INSERT INTO `articledata` VALUES (186, 13, '2025-01-02', 0);
INSERT INTO `articledata` VALUES (187, 13, '2024-12-31', 0);
INSERT INTO `articledata` VALUES (188, 13, '2024-12-29', 8);
INSERT INTO `articledata` VALUES (189, 14, '2025-01-02', 554);
INSERT INTO `articledata` VALUES (190, 14, '2024-12-31', 0);
INSERT INTO `articledata` VALUES (191, 14, '2024-12-29', 8);
INSERT INTO `articledata` VALUES (192, 15, '2025-01-02', 55);
INSERT INTO `articledata` VALUES (193, 15, '2024-12-31', 0);
INSERT INTO `articledata` VALUES (194, 15, '2024-12-30', 66);
INSERT INTO `articledata` VALUES (195, 15, '2024-12-29', 8);
INSERT INTO `articledata` VALUES (196, 16, '2025-01-02', 23);
INSERT INTO `articledata` VALUES (197, 16, '2024-12-31', 0);
INSERT INTO `articledata` VALUES (198, 16, '2024-12-30', 0);
INSERT INTO `articledata` VALUES (199, 16, '2024-12-29', 55);
INSERT INTO `articledata` VALUES (200, 21, '2025-01-02', 23);
INSERT INTO `articledata` VALUES (201, 41, '2025-01-02', 1);
INSERT INTO `articledata` VALUES (202, 28, '2025-01-02', 4);
INSERT INTO `articledata` VALUES (203, 28, '2025-01-01', 0);
INSERT INTO `articledata` VALUES (204, 28, '2024-12-31', 0);
INSERT INTO `articledata` VALUES (205, 29, '2025-01-02', 4);
INSERT INTO `articledata` VALUES (206, 29, '2025-01-01', 0);
INSERT INTO `articledata` VALUES (207, 29, '2024-12-31', 0);
INSERT INTO `articledata` VALUES (208, 30, '2025-01-02', 0);
INSERT INTO `articledata` VALUES (209, 30, '2025-01-01', 7);
INSERT INTO `articledata` VALUES (210, 30, '2024-12-31', 10);
INSERT INTO `articledata` VALUES (211, 42, '2025-01-02', 0);
INSERT INTO `articledata` VALUES (212, 45, '2025-01-03', 2);
INSERT INTO `articledata` VALUES (213, 46, '2025-01-03', 7);
INSERT INTO `articledata` VALUES (214, 12, '2025-01-06', 2);
INSERT INTO `articledata` VALUES (215, 32, '2025-01-06', 2);
INSERT INTO `articledata` VALUES (216, 26, '2025-01-06', 2);
INSERT INTO `articledata` VALUES (217, 46, '2025-01-06', 2);
INSERT INTO `articledata` VALUES (218, 5, '2025-01-06', 1);
INSERT INTO `articledata` VALUES (219, 25, '2025-01-06', 1);
INSERT INTO `articledata` VALUES (220, 15, '2025-01-06', 1);
INSERT INTO `articledata` VALUES (221, 8, '2025-01-06', 1);
INSERT INTO `articledata` VALUES (222, 27, '2025-01-06', 1);
INSERT INTO `articledata` VALUES (223, 44, '2025-01-06', 2);
INSERT INTO `articledata` VALUES (224, 28, '2025-01-06', 1);
INSERT INTO `articledata` VALUES (225, 42, '2025-01-06', 1);
INSERT INTO `articledata` VALUES (226, 11, '2025-01-06', 1);
INSERT INTO `articledata` VALUES (227, 7, '2025-01-06', 1);
INSERT INTO `articledata` VALUES (228, 41, '2025-01-06', 1);
INSERT INTO `articledata` VALUES (229, 21, '2025-01-06', 1);
INSERT INTO `articledata` VALUES (230, 14, '2025-01-06', 1);
INSERT INTO `articledata` VALUES (231, 16, '2025-01-06', 1);
INSERT INTO `articledata` VALUES (232, 13, '2025-01-06', 1);
INSERT INTO `articledata` VALUES (233, 4, '2025-01-06', 2);
INSERT INTO `articledata` VALUES (234, 6, '2025-01-06', 1);
INSERT INTO `articledata` VALUES (235, 43, '2025-01-06', 1);
INSERT INTO `articledata` VALUES (236, 14, '2025-01-08', 1);
INSERT INTO `articledata` VALUES (237, 4, '2025-01-08', 2);
INSERT INTO `articledata` VALUES (238, 13, '2025-01-08', 2);
INSERT INTO `articledata` VALUES (239, 11, '2025-01-08', 1);
INSERT INTO `articledata` VALUES (240, 8, '2025-01-08', 2);
INSERT INTO `articledata` VALUES (241, 12, '2025-01-08', 1);
INSERT INTO `articledata` VALUES (242, 7, '2025-01-08', 2);
INSERT INTO `articledata` VALUES (243, 5, '2025-01-08', 1);
INSERT INTO `articledata` VALUES (244, 21, '2025-01-08', 2);
INSERT INTO `articledata` VALUES (245, 15, '2025-01-08', 1);
INSERT INTO `articledata` VALUES (246, 48, '2025-01-08', 1);
INSERT INTO `articledata` VALUES (247, 6, '2025-01-08', 2);
INSERT INTO `articledata` VALUES (248, 16, '2025-01-08', 2);
INSERT INTO `articledata` VALUES (249, 6, '2025-01-07', 0);
INSERT INTO `articledata` VALUES (250, 6, '2025-01-05', 0);
INSERT INTO `articledata` VALUES (251, 6, '2025-01-04', 0);
INSERT INTO `articledata` VALUES (252, 7, '2025-01-07', 50);
INSERT INTO `articledata` VALUES (253, 7, '2025-01-05', 0);
INSERT INTO `articledata` VALUES (254, 7, '2025-01-04', 0);
INSERT INTO `articledata` VALUES (255, 8, '2025-01-07', 0);
INSERT INTO `articledata` VALUES (256, 8, '2025-01-05', 1);
INSERT INTO `articledata` VALUES (257, 8, '2025-01-04', 0);
INSERT INTO `articledata` VALUES (258, 13, '2025-01-07', 0);
INSERT INTO `articledata` VALUES (259, 13, '2025-01-05', 0);
INSERT INTO `articledata` VALUES (260, 13, '2025-01-04', 66);
INSERT INTO `articledata` VALUES (261, 16, '2025-01-07', 0);
INSERT INTO `articledata` VALUES (262, 16, '2025-01-05', 0);
INSERT INTO `articledata` VALUES (263, 16, '2025-01-04', 0);
INSERT INTO `articledata` VALUES (264, 21, '2025-01-07', 20);
INSERT INTO `articledata` VALUES (265, 21, '2025-01-05', 54);
INSERT INTO `articledata` VALUES (266, 21, '2025-01-04', 23);
INSERT INTO `articledata` VALUES (267, 4, '2025-01-07', 40);
INSERT INTO `articledata` VALUES (268, 4, '2025-01-05', 0);
INSERT INTO `articledata` VALUES (269, 4, '2025-01-04', 23);
INSERT INTO `articledata` VALUES (270, 5, '2025-01-07', 10);
INSERT INTO `articledata` VALUES (271, 5, '2025-01-05', 3);
INSERT INTO `articledata` VALUES (272, 5, '2025-01-04', 0);
INSERT INTO `articledata` VALUES (273, 11, '2025-01-07', 10);
INSERT INTO `articledata` VALUES (274, 11, '2025-01-05', 3);
INSERT INTO `articledata` VALUES (275, 11, '2025-01-04', 50);
INSERT INTO `articledata` VALUES (276, 12, '2025-01-07', 48);
INSERT INTO `articledata` VALUES (277, 12, '2025-01-05', 30);
INSERT INTO `articledata` VALUES (278, 12, '2025-01-04', 50);
INSERT INTO `articledata` VALUES (279, 28, '2025-01-08', 1);
INSERT INTO `articledata` VALUES (280, 42, '2025-01-08', 2);
INSERT INTO `articledata` VALUES (281, 46, '2025-01-08', 3);
INSERT INTO `articledata` VALUES (282, 29, '2025-01-08', 1);
INSERT INTO `articledata` VALUES (283, 45, '2025-01-08', 2);
INSERT INTO `articledata` VALUES (284, 30, '2025-01-08', 1);
INSERT INTO `articledata` VALUES (285, 45, '2025-01-07', 48);
INSERT INTO `articledata` VALUES (286, 45, '2025-01-05', 30);
INSERT INTO `articledata` VALUES (287, 45, '2025-01-04', 50);
INSERT INTO `articledata` VALUES (288, 46, '2025-01-07', 48);
INSERT INTO `articledata` VALUES (289, 46, '2025-01-05', 30);
INSERT INTO `articledata` VALUES (290, 46, '2025-01-04', 50);
INSERT INTO `articledata` VALUES (291, 28, '2025-01-07', 48);
INSERT INTO `articledata` VALUES (292, 28, '2025-01-05', 0);
INSERT INTO `articledata` VALUES (293, 28, '2025-01-04', 50);
INSERT INTO `articledata` VALUES (294, 29, '2025-01-07', 0);
INSERT INTO `articledata` VALUES (295, 29, '2025-01-05', 0);
INSERT INTO `articledata` VALUES (296, 29, '2025-01-04', 50);
INSERT INTO `articledata` VALUES (297, 30, '2025-01-07', 12);
INSERT INTO `articledata` VALUES (298, 30, '2025-01-05', 44);
INSERT INTO `articledata` VALUES (299, 30, '2025-01-04', 11);
INSERT INTO `articledata` VALUES (300, 42, '2025-01-07', 12);
INSERT INTO `articledata` VALUES (301, 42, '2025-01-05', 40);
INSERT INTO `articledata` VALUES (302, 42, '2025-01-04', 11);
INSERT INTO `articledata` VALUES (303, 45, '2025-01-06', 11);
INSERT INTO `articledata` VALUES (304, 29, '2025-01-06', 10);
INSERT INTO `articledata` VALUES (305, 30, '2025-01-06', 0);
INSERT INTO `articledata` VALUES (306, 1, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (307, 3, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (308, 4, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (309, 5, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (310, 6, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (311, 7, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (312, 8, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (313, 9, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (314, 10, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (315, 11, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (316, 12, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (317, 13, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (318, 14, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (319, 15, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (320, 16, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (321, 19, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (322, 21, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (323, 22, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (324, 23, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (325, 36, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (326, 37, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (327, 38, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (328, 39, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (329, 40, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (330, 41, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (331, 48, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (332, 18, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (333, 24, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (334, 25, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (335, 26, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (336, 27, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (337, 34, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (338, 35, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (339, 28, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (340, 29, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (341, 30, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (342, 42, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (343, 45, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (344, 46, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (345, 47, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (346, 31, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (347, 32, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (348, 33, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (349, 43, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (350, 44, '2025-01-12', 0);
INSERT INTO `articledata` VALUES (351, 1, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (352, 3, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (353, 4, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (354, 5, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (355, 6, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (356, 7, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (357, 8, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (358, 9, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (359, 10, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (360, 11, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (361, 12, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (362, 13, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (363, 14, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (364, 15, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (365, 16, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (366, 19, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (367, 21, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (368, 22, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (369, 23, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (370, 36, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (371, 37, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (372, 38, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (373, 39, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (374, 40, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (375, 41, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (376, 48, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (377, 18, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (378, 24, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (379, 25, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (380, 26, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (381, 27, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (382, 34, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (383, 35, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (384, 28, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (385, 29, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (386, 30, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (387, 42, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (388, 45, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (389, 46, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (390, 47, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (391, 31, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (392, 32, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (393, 33, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (394, 43, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (395, 44, '2025-01-25', 0);
INSERT INTO `articledata` VALUES (396, 1, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (397, 3, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (398, 4, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (399, 5, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (400, 6, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (401, 7, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (402, 8, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (403, 9, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (404, 10, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (405, 11, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (406, 12, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (407, 13, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (408, 14, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (409, 15, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (410, 16, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (411, 19, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (412, 21, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (413, 22, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (414, 23, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (415, 36, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (416, 37, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (417, 38, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (418, 39, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (419, 40, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (420, 41, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (421, 48, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (422, 18, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (423, 24, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (424, 25, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (425, 26, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (426, 27, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (427, 34, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (428, 35, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (429, 28, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (430, 29, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (431, 30, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (432, 42, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (433, 45, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (434, 46, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (435, 47, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (436, 31, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (437, 32, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (438, 33, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (439, 43, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (440, 44, '2025-01-28', 0);
INSERT INTO `articledata` VALUES (441, 1, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (442, 3, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (443, 4, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (444, 5, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (445, 6, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (446, 7, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (447, 8, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (448, 9, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (449, 10, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (450, 11, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (451, 12, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (452, 13, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (453, 14, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (454, 15, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (455, 16, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (456, 19, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (457, 21, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (458, 22, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (459, 23, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (460, 36, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (461, 37, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (462, 38, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (463, 39, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (464, 40, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (465, 41, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (466, 48, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (467, 18, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (468, 24, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (469, 25, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (470, 26, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (471, 27, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (472, 34, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (473, 35, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (474, 28, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (475, 29, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (476, 30, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (477, 42, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (478, 45, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (479, 46, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (480, 47, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (481, 31, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (482, 32, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (483, 33, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (484, 43, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (485, 44, '2025-02-03', 0);
INSERT INTO `articledata` VALUES (504, 1, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (505, 3, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (506, 4, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (507, 5, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (508, 6, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (509, 7, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (510, 8, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (511, 9, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (512, 10, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (513, 11, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (514, 12, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (515, 13, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (516, 14, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (517, 15, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (518, 16, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (519, 19, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (520, 21, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (521, 22, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (522, 23, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (523, 36, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (524, 37, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (525, 38, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (526, 39, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (527, 40, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (528, 41, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (529, 48, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (530, 18, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (531, 24, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (532, 25, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (533, 26, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (534, 27, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (535, 34, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (536, 35, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (537, 28, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (538, 29, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (539, 30, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (540, 42, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (541, 45, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (542, 46, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (543, 47, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (544, 31, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (545, 32, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (546, 33, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (547, 43, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (548, 44, '2025-02-04', 0);
INSERT INTO `articledata` VALUES (549, 1, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (550, 3, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (551, 4, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (552, 5, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (553, 6, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (554, 7, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (555, 8, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (556, 9, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (557, 10, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (558, 11, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (559, 12, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (560, 13, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (561, 14, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (562, 15, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (563, 16, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (564, 19, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (565, 21, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (566, 22, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (567, 23, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (568, 36, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (569, 37, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (570, 38, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (571, 39, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (572, 40, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (573, 41, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (574, 48, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (575, 18, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (576, 24, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (577, 25, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (578, 26, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (579, 27, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (580, 34, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (581, 35, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (582, 28, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (583, 29, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (584, 30, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (585, 42, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (586, 45, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (587, 46, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (588, 47, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (589, 31, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (590, 32, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (591, 33, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (592, 43, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (593, 44, '2025-02-07', 0);
INSERT INTO `articledata` VALUES (612, 1, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (613, 3, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (614, 4, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (615, 5, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (616, 6, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (617, 7, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (618, 8, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (619, 9, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (620, 10, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (621, 11, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (622, 12, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (623, 13, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (624, 14, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (625, 15, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (626, 16, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (627, 19, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (628, 21, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (629, 22, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (630, 23, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (631, 36, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (632, 37, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (633, 38, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (634, 39, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (635, 40, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (636, 41, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (637, 48, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (638, 18, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (639, 24, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (640, 25, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (641, 26, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (642, 27, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (643, 34, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (644, 35, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (645, 28, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (646, 29, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (647, 30, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (648, 42, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (649, 45, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (650, 46, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (651, 47, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (652, 31, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (653, 32, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (654, 33, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (655, 43, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (656, 44, '2025-02-08', 0);
INSERT INTO `articledata` VALUES (657, 1, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (658, 3, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (659, 4, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (660, 5, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (661, 6, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (662, 7, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (663, 8, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (664, 9, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (665, 10, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (666, 11, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (667, 12, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (668, 13, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (669, 14, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (670, 15, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (671, 16, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (672, 19, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (673, 21, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (674, 22, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (675, 23, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (676, 36, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (677, 37, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (678, 38, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (679, 39, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (680, 40, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (681, 41, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (682, 48, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (683, 18, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (684, 24, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (685, 25, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (686, 26, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (687, 27, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (688, 34, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (689, 35, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (690, 28, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (691, 29, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (692, 30, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (693, 42, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (694, 45, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (695, 46, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (696, 47, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (697, 31, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (698, 32, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (699, 33, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (700, 43, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (701, 44, '2025-02-09', 0);
INSERT INTO `articledata` VALUES (720, 1, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (721, 3, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (722, 4, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (723, 5, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (724, 6, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (725, 7, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (726, 8, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (727, 9, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (728, 10, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (729, 11, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (730, 12, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (731, 13, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (732, 14, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (733, 15, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (734, 16, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (735, 19, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (736, 21, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (737, 22, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (738, 23, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (739, 36, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (740, 37, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (741, 38, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (742, 39, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (743, 40, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (744, 41, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (745, 48, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (746, 18, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (747, 24, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (748, 25, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (749, 26, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (750, 27, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (751, 34, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (752, 35, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (753, 28, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (754, 29, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (755, 30, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (756, 42, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (757, 45, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (758, 46, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (759, 47, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (760, 31, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (761, 32, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (762, 33, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (763, 43, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (764, 44, '2025-02-10', 0);
INSERT INTO `articledata` VALUES (783, 1, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (784, 3, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (785, 4, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (786, 5, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (787, 6, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (788, 7, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (789, 8, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (790, 9, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (791, 10, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (792, 11, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (793, 12, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (794, 13, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (795, 14, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (796, 15, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (797, 16, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (798, 19, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (799, 21, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (800, 22, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (801, 23, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (802, 36, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (803, 37, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (804, 38, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (805, 39, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (806, 40, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (807, 41, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (808, 48, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (809, 18, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (810, 24, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (811, 25, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (812, 26, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (813, 27, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (814, 34, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (815, 35, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (816, 28, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (817, 29, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (818, 30, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (819, 42, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (820, 45, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (821, 46, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (822, 47, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (823, 31, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (824, 32, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (825, 33, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (826, 43, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (827, 44, '2025-02-11', 0);
INSERT INTO `articledata` VALUES (828, 1, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (829, 3, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (830, 4, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (831, 5, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (832, 6, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (833, 7, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (834, 8, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (835, 9, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (836, 10, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (837, 11, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (838, 12, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (839, 13, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (840, 14, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (841, 15, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (842, 16, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (843, 19, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (844, 21, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (845, 22, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (846, 23, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (847, 36, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (848, 37, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (849, 38, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (850, 39, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (851, 40, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (852, 41, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (853, 48, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (854, 18, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (855, 24, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (856, 25, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (857, 26, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (858, 27, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (859, 34, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (860, 35, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (861, 28, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (862, 29, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (863, 30, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (864, 42, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (865, 45, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (866, 46, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (867, 47, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (868, 31, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (869, 32, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (870, 33, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (871, 43, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (872, 44, '2025-04-20', 0);
INSERT INTO `articledata` VALUES (873, 1, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (874, 3, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (875, 4, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (876, 5, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (877, 6, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (878, 7, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (879, 8, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (880, 9, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (881, 10, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (882, 11, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (883, 12, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (884, 13, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (885, 14, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (886, 15, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (887, 16, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (888, 19, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (889, 21, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (890, 22, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (891, 23, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (892, 36, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (893, 37, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (894, 38, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (895, 39, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (896, 40, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (897, 41, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (898, 48, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (899, 18, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (900, 24, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (901, 25, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (902, 26, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (903, 27, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (904, 34, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (905, 35, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (906, 28, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (907, 29, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (908, 30, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (909, 42, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (910, 45, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (911, 46, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (912, 47, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (913, 31, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (914, 32, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (915, 33, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (916, 43, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (917, 44, '2025-04-21', 0);
INSERT INTO `articledata` VALUES (936, 1, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (937, 3, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (938, 4, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (939, 5, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (940, 6, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (941, 7, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (942, 8, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (943, 9, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (944, 10, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (945, 11, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (946, 12, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (947, 13, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (948, 14, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (949, 15, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (950, 16, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (951, 19, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (952, 21, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (953, 22, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (954, 23, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (955, 36, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (956, 37, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (957, 38, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (958, 39, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (959, 40, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (960, 41, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (961, 48, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (962, 18, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (963, 24, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (964, 25, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (965, 26, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (966, 27, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (967, 34, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (968, 35, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (969, 28, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (970, 29, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (971, 30, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (972, 42, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (973, 45, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (974, 46, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (975, 47, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (976, 31, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (977, 32, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (978, 33, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (979, 43, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (980, 44, '2025-04-22', 0);
INSERT INTO `articledata` VALUES (981, 1, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (982, 3, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (983, 4, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (984, 5, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (985, 6, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (986, 7, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (987, 8, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (988, 9, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (989, 10, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (990, 11, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (991, 12, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (992, 13, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (993, 14, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (994, 15, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (995, 16, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (996, 19, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (997, 21, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (998, 22, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (999, 23, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1000, 36, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1001, 37, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1002, 38, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1003, 39, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1004, 40, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1005, 41, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1006, 48, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1007, 18, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1008, 24, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1009, 25, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1010, 26, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1011, 27, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1012, 34, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1013, 35, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1014, 28, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1015, 29, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1016, 30, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1017, 42, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1018, 45, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1019, 46, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1020, 47, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1021, 31, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1022, 32, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1023, 33, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1024, 43, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1025, 44, '2025-06-06', 0);
INSERT INTO `articledata` VALUES (1026, 1, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1027, 3, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1028, 4, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1029, 5, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1030, 6, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1031, 7, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1032, 8, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1033, 9, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1034, 10, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1035, 11, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1036, 12, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1037, 13, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1038, 14, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1039, 15, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1040, 16, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1041, 19, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1042, 21, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1043, 22, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1044, 23, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1045, 36, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1046, 37, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1047, 38, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1048, 39, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1049, 40, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1050, 41, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1051, 48, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1052, 18, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1053, 24, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1054, 25, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1055, 26, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1056, 27, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1057, 34, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1058, 35, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1059, 28, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1060, 29, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1061, 30, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1062, 42, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1063, 45, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1064, 46, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1065, 47, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1066, 31, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1067, 32, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1068, 33, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1069, 43, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1070, 44, '2025-06-12', 0);
INSERT INTO `articledata` VALUES (1071, 1, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1072, 3, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1073, 4, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1074, 5, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1075, 6, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1076, 7, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1077, 8, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1078, 9, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1079, 10, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1080, 11, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1081, 12, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1082, 13, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1083, 14, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1084, 15, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1085, 16, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1086, 19, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1087, 21, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1088, 22, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1089, 23, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1090, 36, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1091, 37, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1092, 38, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1093, 39, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1094, 40, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1095, 41, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1096, 48, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1097, 18, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1098, 24, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1099, 25, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1100, 26, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1101, 27, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1102, 34, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1103, 35, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1104, 28, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1105, 29, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1106, 30, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1107, 42, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1108, 45, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1109, 46, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1110, 47, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1111, 31, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1112, 32, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1113, 33, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1114, 43, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1115, 44, '2025-06-13', 0);
INSERT INTO `articledata` VALUES (1116, 1, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1117, 3, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1118, 4, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1119, 5, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1120, 6, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1121, 7, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1122, 8, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1123, 9, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1124, 10, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1125, 11, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1126, 12, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1127, 13, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1128, 14, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1129, 15, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1130, 16, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1131, 19, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1132, 21, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1133, 22, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1134, 23, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1135, 36, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1136, 37, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1137, 38, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1138, 39, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1139, 40, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1140, 41, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1141, 48, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1142, 18, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1143, 24, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1144, 25, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1145, 26, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1146, 27, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1147, 34, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1148, 35, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1149, 28, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1150, 29, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1151, 30, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1152, 42, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1153, 45, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1154, 46, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1155, 47, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1156, 31, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1157, 32, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1158, 33, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1159, 43, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1160, 44, '2025-06-15', 0);
INSERT INTO `articledata` VALUES (1161, 1, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1162, 3, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1163, 4, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1164, 5, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1165, 6, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1166, 7, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1167, 8, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1168, 9, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1169, 10, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1170, 11, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1171, 12, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1172, 13, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1173, 14, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1174, 15, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1175, 16, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1176, 19, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1177, 21, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1178, 22, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1179, 23, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1180, 36, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1181, 37, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1182, 38, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1183, 39, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1184, 40, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1185, 41, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1186, 48, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1187, 18, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1188, 24, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1189, 25, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1190, 26, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1191, 27, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1192, 34, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1193, 35, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1194, 28, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1195, 29, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1196, 30, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1197, 42, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1198, 45, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1199, 46, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1200, 47, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1201, 31, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1202, 32, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1203, 33, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1204, 43, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1205, 44, '2025-06-16', 0);
INSERT INTO `articledata` VALUES (1224, 1, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1225, 3, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1226, 4, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1227, 5, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1228, 6, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1229, 7, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1230, 8, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1231, 9, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1232, 10, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1233, 11, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1234, 12, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1235, 13, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1236, 14, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1237, 15, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1238, 16, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1239, 19, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1240, 21, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1241, 22, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1242, 23, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1243, 36, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1244, 37, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1245, 38, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1246, 39, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1247, 40, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1248, 41, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1249, 48, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1250, 18, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1251, 24, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1252, 25, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1253, 26, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1254, 27, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1255, 34, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1256, 35, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1257, 28, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1258, 29, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1259, 30, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1260, 42, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1261, 45, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1262, 46, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1263, 47, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1264, 31, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1265, 32, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1266, 33, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1267, 43, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1268, 44, '2025-06-17', 0);
INSERT INTO `articledata` VALUES (1287, 1, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1288, 3, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1289, 4, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1290, 5, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1291, 6, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1292, 7, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1293, 8, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1294, 9, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1295, 10, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1296, 11, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1297, 12, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1298, 13, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1299, 14, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1300, 15, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1301, 16, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1302, 19, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1303, 21, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1304, 22, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1305, 23, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1306, 36, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1307, 37, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1308, 38, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1309, 39, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1310, 40, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1311, 41, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1312, 48, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1313, 18, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1314, 24, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1315, 25, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1316, 26, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1317, 27, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1318, 34, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1319, 35, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1320, 28, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1321, 29, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1322, 30, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1323, 42, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1324, 45, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1325, 46, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1326, 47, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1327, 31, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1328, 32, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1329, 33, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1330, 43, '2025-06-18', 0);
INSERT INTO `articledata` VALUES (1331, 44, '2025-06-18', 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int unsigned NOT NULL COMMENT 'ID',
  `category_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `category_alias` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类别名',
  `create_user` int unsigned NOT NULL COMMENT '创建人ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  `isexit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_category_user`(`create_user`) USING BTREE,
  CONSTRAINT `fk_category_user` FOREIGN KEY (`create_user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '哲学', 'GE', 1, '2024-12-20 16:22:11', '2024-12-20 17:16:57', 'true');
INSERT INTO `category` VALUES (2, '政治', 'CN', 1, '2024-12-20 16:26:02', '2024-12-20 16:26:02', 'true');
INSERT INTO `category` VALUES (4, '人工智能', 'AI', 3, '2024-12-24 19:52:40', '2024-12-25 19:26:24', 'true');
INSERT INTO `category` VALUES (5, '历史', 'History', 3, '2024-12-24 19:55:21', '2024-12-24 20:26:44', 'true');
INSERT INTO `category` VALUES (6, '政治哲学', 'ZZZ', 3, '2024-12-24 19:56:37', '2025-01-02 10:32:04', 'true');
INSERT INTO `category` VALUES (8, '文化', 'culture', 3, '2024-12-24 20:00:47', '2024-12-24 20:00:47', 'true');
INSERT INTO `category` VALUES (9, '史诗', 'HIS', 3, '2024-12-24 20:01:48', '2024-12-24 20:01:48', 'true');
INSERT INTO `category` VALUES (10, '电影', 'MV', 3, '2024-12-24 20:18:51', '2024-12-24 20:18:51', 'true');
INSERT INTO `category` VALUES (11, '动漫', 'dongman', 3, '2024-12-24 20:29:09', '2024-12-24 20:29:09', 'true');
INSERT INTO `category` VALUES (13, '艺术', 'ART', 1, '2024-12-25 09:01:09', '2024-12-25 09:01:09', 'true');
INSERT INTO `category` VALUES (15, '励志', 'LZ', 3, '2024-12-27 14:21:23', '2024-12-27 14:21:23', 'true');
INSERT INTO `category` VALUES (16, '哲学', 'ZX', 11, '2024-12-30 16:06:10', '2024-12-30 16:06:10', 'true');
INSERT INTO `category` VALUES (17, '宠物', 'KD', 12, '2024-12-30 16:07:44', '2024-12-30 16:07:44', 'true');
INSERT INTO `category` VALUES (18, '黑话', 'BS', 13, '2024-12-30 16:09:56', '2024-12-30 16:09:56', 'true');
INSERT INTO `category` VALUES (19, '中医', 'ZY', 3, '2024-12-30 20:03:09', '2024-12-30 20:03:09', 'true');
INSERT INTO `category` VALUES (20, '散文', 'SW', 3, '2024-12-30 20:20:14', '2024-12-30 20:20:14', 'false');
INSERT INTO `category` VALUES (21, '美食', 'ms', 3, '2024-12-30 20:27:11', '2024-12-30 20:27:11', 'false');
INSERT INTO `category` VALUES (22, '奇幻', 'magic', 3, '2024-12-31 16:39:40', '2024-12-31 16:39:40', 'true');
INSERT INTO `category` VALUES (23, '电竞', 'DJ', 17, '2025-01-01 21:09:00', '2025-01-01 21:09:00', 'true');
INSERT INTO `category` VALUES (24, '直升机', 'ZSJ', 18, '2025-01-01 22:13:23', '2025-01-01 22:13:23', 'true');
INSERT INTO `category` VALUES (25, '电子科技', 'EE', 3, '2025-01-02 10:14:47', '2025-01-02 10:14:47', 'true');
INSERT INTO `category` VALUES (26, '科技', 'SC', 12, '2025-01-03 14:26:54', '2025-01-03 14:26:54', 'true');
INSERT INTO `category` VALUES (27, '社会热点', 'SoHot', 3, '2025-01-07 16:31:39', '2025-01-07 16:31:39', 'false');
INSERT INTO `category` VALUES (28, ' 人文艺术', 'Art', 3, '2025-01-07 16:37:16', '2025-01-07 16:40:07', 'true');
INSERT INTO `category` VALUES (29, '计算机', 'CS', 3, '2025-01-08 14:52:24', '2025-01-08 14:52:24', 'true');

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow`  (
  `id` int unsigned NOT NULL,
  `follower` int unsigned NOT NULL,
  `writer` int unsigned NOT NULL,
  `time` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_writer_user`(`writer`) USING BTREE,
  CONSTRAINT `fk_writer_user` FOREIGN KEY (`writer`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES (3, 8, 3, '2024-12-01');
INSERT INTO `follow` VALUES (4, 8, 11, '2025-01-01');
INSERT INTO `follow` VALUES (5, 16, 3, '2025-01-01');
INSERT INTO `follow` VALUES (8, 16, 11, '2025-01-01');
INSERT INTO `follow` VALUES (9, 16, 12, '2025-01-01');
INSERT INTO `follow` VALUES (10, 16, 13, '2025-01-01');
INSERT INTO `follow` VALUES (13, 16, 17, '2025-01-01');
INSERT INTO `follow` VALUES (14, 16, 18, '2025-01-01');
INSERT INTO `follow` VALUES (16, 22, 3, '2025-01-03');
INSERT INTO `follow` VALUES (17, 23, 3, '2025-01-03');
INSERT INTO `follow` VALUES (18, 16, 18, '2025-01-06');

-- ----------------------------
-- Table structure for followstatus
-- ----------------------------
DROP TABLE IF EXISTS `followstatus`;
CREATE TABLE `followstatus`  (
  `id` int unsigned NOT NULL,
  `userid` int unsigned NOT NULL,
  `count` int unsigned NOT NULL,
  `time` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_followstatus_userid`(`userid`) USING BTREE,
  CONSTRAINT `fk_followstatus_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of followstatus
-- ----------------------------
INSERT INTO `followstatus` VALUES (1, 3, 130, '2024-12-01');
INSERT INTO `followstatus` VALUES (2, 3, 2, '2024-06-01');
INSERT INTO `followstatus` VALUES (3, 3, 10, '2024-07-01');
INSERT INTO `followstatus` VALUES (4, 3, 20, '2024-08-01');
INSERT INTO `followstatus` VALUES (5, 3, 67, '2024-09-01');
INSERT INTO `followstatus` VALUES (6, 3, 77, '2024-10-01');
INSERT INTO `followstatus` VALUES (7, 3, 80, '2024-11-01');
INSERT INTO `followstatus` VALUES (8, 11, 34, '2024-06-01');
INSERT INTO `followstatus` VALUES (9, 12, 203, '2024-11-01');
INSERT INTO `followstatus` VALUES (10, 13, 76, '2024-12-01');
INSERT INTO `followstatus` VALUES (11, 6, 105, '2024-11-01');
INSERT INTO `followstatus` VALUES (12, 12, 400, '2024-12-01');
INSERT INTO `followstatus` VALUES (13, 11, 2, '2025-01-01');
INSERT INTO `followstatus` VALUES (14, 3, 5, '2025-01-01');
INSERT INTO `followstatus` VALUES (15, 12, 2, '2025-01-01');
INSERT INTO `followstatus` VALUES (16, 13, 1, '2025-01-01');
INSERT INTO `followstatus` VALUES (17, 17, 2, '2025-01-01');
INSERT INTO `followstatus` VALUES (18, 18, 2, '2025-01-01');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `id` int unsigned NOT NULL,
  `articleid` int unsigned,
  `userid` int unsigned,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `articleid`(`articleid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `history_ibfk_1` FOREIGN KEY (`articleid`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `history_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 356 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (1, 14, 8, '2024-12-26');
INSERT INTO `history` VALUES (2, 14, 8, '2024-12-26');
INSERT INTO `history` VALUES (3, 14, 8, '2024-12-26');
INSERT INTO `history` VALUES (4, 14, 8, '2024-12-26');
INSERT INTO `history` VALUES (5, 14, 8, '2024-12-26');
INSERT INTO `history` VALUES (6, 14, 7, '2024-12-26');
INSERT INTO `history` VALUES (7, 9, 8, '2024-12-04');
INSERT INTO `history` VALUES (8, 10, 8, '2024-12-06');
INSERT INTO `history` VALUES (9, 11, 8, '2024-12-08');
INSERT INTO `history` VALUES (10, 8, 8, '2024-12-10');
INSERT INTO `history` VALUES (11, 12, 8, '2024-12-05');
INSERT INTO `history` VALUES (12, 7, 8, '2024-12-07');
INSERT INTO `history` VALUES (13, 9, 8, '2024-12-11');
INSERT INTO `history` VALUES (14, 13, 8, '2024-12-12');
INSERT INTO `history` VALUES (15, 10, 8, '2024-12-14');
INSERT INTO `history` VALUES (16, 11, 8, '2024-12-13');
INSERT INTO `history` VALUES (17, 12, 8, '2024-12-15');
INSERT INTO `history` VALUES (18, 8, 8, '2024-12-09');
INSERT INTO `history` VALUES (19, 13, 8, '2024-12-16');
INSERT INTO `history` VALUES (20, 7, 8, '2024-12-17');
INSERT INTO `history` VALUES (21, 9, 8, '2024-12-18');
INSERT INTO `history` VALUES (22, 10, 8, '2024-12-19');
INSERT INTO `history` VALUES (23, 8, 8, '2024-12-20');
INSERT INTO `history` VALUES (24, 12, 8, '2024-12-21');
INSERT INTO `history` VALUES (25, 13, 8, '2024-12-22');
INSERT INTO `history` VALUES (26, 7, 8, '2024-12-23');
INSERT INTO `history` VALUES (27, 11, 8, '2024-12-24');
INSERT INTO `history` VALUES (28, 10, 8, '2024-12-25');
INSERT INTO `history` VALUES (29, 9, 8, '2024-12-03');
INSERT INTO `history` VALUES (30, 8, 8, '2024-12-04');
INSERT INTO `history` VALUES (31, 12, 8, '2024-12-06');
INSERT INTO `history` VALUES (32, 7, 8, '2024-12-08');
INSERT INTO `history` VALUES (33, 13, 8, '2024-12-10');
INSERT INTO `history` VALUES (34, 11, 8, '2024-12-11');
INSERT INTO `history` VALUES (35, 10, 8, '2024-12-12');
INSERT INTO `history` VALUES (36, 12, 8, '2024-12-14');
INSERT INTO `history` VALUES (37, 9, 8, '2024-12-17');
INSERT INTO `history` VALUES (38, 9, 8, '2024-12-04');
INSERT INTO `history` VALUES (39, 10, 8, '2024-12-06');
INSERT INTO `history` VALUES (40, 11, 8, '2024-12-08');
INSERT INTO `history` VALUES (41, 8, 8, '2024-12-10');
INSERT INTO `history` VALUES (42, 12, 8, '2024-12-05');
INSERT INTO `history` VALUES (43, 7, 8, '2024-12-07');
INSERT INTO `history` VALUES (44, 9, 8, '2024-12-11');
INSERT INTO `history` VALUES (45, 13, 8, '2024-12-12');
INSERT INTO `history` VALUES (46, 10, 8, '2024-12-14');
INSERT INTO `history` VALUES (47, 11, 8, '2024-12-13');
INSERT INTO `history` VALUES (48, 12, 8, '2024-12-15');
INSERT INTO `history` VALUES (49, 8, 8, '2024-12-09');
INSERT INTO `history` VALUES (50, 13, 8, '2024-12-16');
INSERT INTO `history` VALUES (51, 7, 8, '2024-12-17');
INSERT INTO `history` VALUES (52, 9, 8, '2024-12-18');
INSERT INTO `history` VALUES (53, 10, 8, '2024-12-19');
INSERT INTO `history` VALUES (54, 8, 8, '2024-12-20');
INSERT INTO `history` VALUES (55, 12, 8, '2024-12-21');
INSERT INTO `history` VALUES (56, 13, 8, '2024-12-22');
INSERT INTO `history` VALUES (57, 7, 8, '2024-12-23');
INSERT INTO `history` VALUES (58, 11, 8, '2024-12-24');
INSERT INTO `history` VALUES (59, 10, 8, '2024-12-25');
INSERT INTO `history` VALUES (60, 9, 8, '2024-12-04');
INSERT INTO `history` VALUES (61, 10, 8, '2024-12-06');
INSERT INTO `history` VALUES (62, 11, 8, '2024-12-08');
INSERT INTO `history` VALUES (63, 8, 8, '2024-12-10');
INSERT INTO `history` VALUES (64, 12, 8, '2024-12-05');
INSERT INTO `history` VALUES (65, 7, 8, '2024-12-07');
INSERT INTO `history` VALUES (66, 9, 8, '2024-12-11');
INSERT INTO `history` VALUES (67, 13, 8, '2024-12-12');
INSERT INTO `history` VALUES (68, 10, 8, '2024-12-14');
INSERT INTO `history` VALUES (69, 11, 8, '2024-12-13');
INSERT INTO `history` VALUES (70, 12, 8, '2024-12-15');
INSERT INTO `history` VALUES (71, 8, 8, '2024-12-09');
INSERT INTO `history` VALUES (72, 13, 8, '2024-12-16');
INSERT INTO `history` VALUES (73, 7, 8, '2024-12-17');
INSERT INTO `history` VALUES (74, 9, 8, '2024-12-18');
INSERT INTO `history` VALUES (75, 10, 8, '2024-12-19');
INSERT INTO `history` VALUES (76, 8, 8, '2024-12-20');
INSERT INTO `history` VALUES (77, 12, 8, '2024-12-21');
INSERT INTO `history` VALUES (78, 13, 8, '2024-12-22');
INSERT INTO `history` VALUES (79, 7, 8, '2024-12-23');
INSERT INTO `history` VALUES (80, 11, 8, '2024-12-24');
INSERT INTO `history` VALUES (81, 10, 8, '2024-12-25');
INSERT INTO `history` VALUES (82, 9, 8, '2024-12-04');
INSERT INTO `history` VALUES (83, 10, 8, '2024-12-06');
INSERT INTO `history` VALUES (84, 11, 8, '2024-12-08');
INSERT INTO `history` VALUES (85, 8, 8, '2024-12-10');
INSERT INTO `history` VALUES (86, 12, 8, '2024-12-05');
INSERT INTO `history` VALUES (87, 7, 8, '2024-12-07');
INSERT INTO `history` VALUES (88, 9, 8, '2024-12-11');
INSERT INTO `history` VALUES (89, 13, 8, '2024-12-12');
INSERT INTO `history` VALUES (90, 10, 8, '2024-12-14');
INSERT INTO `history` VALUES (91, 11, 8, '2024-12-13');
INSERT INTO `history` VALUES (92, 12, 8, '2024-12-15');
INSERT INTO `history` VALUES (93, 8, 8, '2024-12-09');
INSERT INTO `history` VALUES (94, 13, 8, '2024-12-16');
INSERT INTO `history` VALUES (95, 7, 8, '2024-12-17');
INSERT INTO `history` VALUES (96, 9, 8, '2024-12-18');
INSERT INTO `history` VALUES (97, 10, 8, '2024-12-19');
INSERT INTO `history` VALUES (98, 8, 8, '2024-12-20');
INSERT INTO `history` VALUES (99, 12, 8, '2024-12-21');
INSERT INTO `history` VALUES (100, 13, 8, '2024-12-22');
INSERT INTO `history` VALUES (101, 7, 8, '2024-12-23');
INSERT INTO `history` VALUES (102, 11, 8, '2024-12-24');
INSERT INTO `history` VALUES (103, 10, 8, '2024-12-25');
INSERT INTO `history` VALUES (104, 4, 8, '2024-12-26');
INSERT INTO `history` VALUES (105, 4, 8, '2024-12-26');
INSERT INTO `history` VALUES (106, 5, 8, '2024-12-26');
INSERT INTO `history` VALUES (107, 6, 8, '2024-12-26');
INSERT INTO `history` VALUES (108, 6, 8, '2024-12-26');
INSERT INTO `history` VALUES (109, 6, 8, '2024-12-26');
INSERT INTO `history` VALUES (110, 6, 8, '2024-12-26');
INSERT INTO `history` VALUES (111, 7, 8, '2024-12-26');
INSERT INTO `history` VALUES (112, 7, 8, '2024-12-26');
INSERT INTO `history` VALUES (113, 8, 8, '2024-12-26');
INSERT INTO `history` VALUES (114, 8, 8, '2024-12-26');
INSERT INTO `history` VALUES (115, 8, 8, '2024-12-26');
INSERT INTO `history` VALUES (116, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (117, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (118, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (119, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (120, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (121, 10, 8, '2024-12-26');
INSERT INTO `history` VALUES (122, 10, 8, '2024-12-26');
INSERT INTO `history` VALUES (123, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (124, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (125, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (126, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (127, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (128, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (129, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (130, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (131, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (132, 12, 8, '2024-12-26');
INSERT INTO `history` VALUES (133, 12, 8, '2024-12-26');
INSERT INTO `history` VALUES (134, 13, 8, '2024-12-26');
INSERT INTO `history` VALUES (135, 14, 8, '2024-12-26');
INSERT INTO `history` VALUES (136, 4, 8, '2024-12-26');
INSERT INTO `history` VALUES (137, 4, 8, '2024-12-26');
INSERT INTO `history` VALUES (138, 5, 8, '2024-12-26');
INSERT INTO `history` VALUES (139, 6, 8, '2024-12-26');
INSERT INTO `history` VALUES (140, 6, 8, '2024-12-26');
INSERT INTO `history` VALUES (141, 6, 8, '2024-12-26');
INSERT INTO `history` VALUES (142, 6, 8, '2024-12-26');
INSERT INTO `history` VALUES (143, 7, 8, '2024-12-26');
INSERT INTO `history` VALUES (144, 7, 8, '2024-12-26');
INSERT INTO `history` VALUES (145, 8, 8, '2024-12-26');
INSERT INTO `history` VALUES (146, 8, 8, '2024-12-26');
INSERT INTO `history` VALUES (147, 8, 8, '2024-12-26');
INSERT INTO `history` VALUES (148, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (149, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (150, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (151, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (152, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (153, 10, 8, '2024-12-26');
INSERT INTO `history` VALUES (154, 10, 8, '2024-12-26');
INSERT INTO `history` VALUES (155, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (156, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (157, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (158, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (159, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (160, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (161, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (162, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (163, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (164, 12, 8, '2024-12-26');
INSERT INTO `history` VALUES (165, 12, 8, '2024-12-26');
INSERT INTO `history` VALUES (166, 13, 8, '2024-12-26');
INSERT INTO `history` VALUES (167, 14, 8, '2024-12-26');
INSERT INTO `history` VALUES (168, 4, 8, '2024-12-26');
INSERT INTO `history` VALUES (169, 4, 8, '2024-12-26');
INSERT INTO `history` VALUES (170, 5, 8, '2024-12-26');
INSERT INTO `history` VALUES (171, 6, 8, '2024-12-26');
INSERT INTO `history` VALUES (172, 6, 8, '2024-12-26');
INSERT INTO `history` VALUES (173, 6, 8, '2024-12-26');
INSERT INTO `history` VALUES (174, 6, 8, '2024-12-26');
INSERT INTO `history` VALUES (175, 7, 8, '2024-12-26');
INSERT INTO `history` VALUES (176, 7, 8, '2024-12-26');
INSERT INTO `history` VALUES (177, 8, 8, '2024-12-26');
INSERT INTO `history` VALUES (178, 8, 8, '2024-12-26');
INSERT INTO `history` VALUES (179, 8, 8, '2024-12-26');
INSERT INTO `history` VALUES (180, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (181, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (182, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (183, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (184, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (185, 10, 8, '2024-12-26');
INSERT INTO `history` VALUES (186, 10, 8, '2024-12-26');
INSERT INTO `history` VALUES (187, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (188, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (189, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (190, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (191, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (192, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (193, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (194, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (195, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (196, 12, 8, '2024-12-26');
INSERT INTO `history` VALUES (197, 12, 8, '2024-12-26');
INSERT INTO `history` VALUES (198, 13, 8, '2024-12-26');
INSERT INTO `history` VALUES (199, 14, 8, '2024-12-26');
INSERT INTO `history` VALUES (200, 4, 8, '2024-12-26');
INSERT INTO `history` VALUES (201, 4, 8, '2024-12-26');
INSERT INTO `history` VALUES (202, 5, 8, '2024-12-26');
INSERT INTO `history` VALUES (203, 6, 8, '2024-12-26');
INSERT INTO `history` VALUES (204, 6, 8, '2024-12-26');
INSERT INTO `history` VALUES (205, 6, 8, '2024-12-26');
INSERT INTO `history` VALUES (206, 6, 8, '2024-12-26');
INSERT INTO `history` VALUES (207, 7, 8, '2024-12-26');
INSERT INTO `history` VALUES (208, 7, 8, '2024-12-26');
INSERT INTO `history` VALUES (209, 8, 8, '2024-12-26');
INSERT INTO `history` VALUES (210, 8, 8, '2024-12-26');
INSERT INTO `history` VALUES (211, 8, 8, '2024-12-26');
INSERT INTO `history` VALUES (212, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (213, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (214, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (215, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (216, 9, 8, '2024-12-26');
INSERT INTO `history` VALUES (217, 10, 8, '2024-12-26');
INSERT INTO `history` VALUES (218, 10, 8, '2024-12-26');
INSERT INTO `history` VALUES (219, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (220, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (221, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (222, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (223, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (224, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (225, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (226, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (227, 11, 8, '2024-12-26');
INSERT INTO `history` VALUES (228, 12, 8, '2024-12-26');
INSERT INTO `history` VALUES (229, 12, 8, '2024-12-26');
INSERT INTO `history` VALUES (230, 13, 8, '2024-12-26');
INSERT INTO `history` VALUES (231, 14, 8, '2024-12-26');
INSERT INTO `history` VALUES (232, 14, 8, '2024-12-30');
INSERT INTO `history` VALUES (233, 14, 8, '2024-12-30');
INSERT INTO `history` VALUES (234, 13, 8, '2024-12-30');
INSERT INTO `history` VALUES (235, 13, 8, '2024-12-30');
INSERT INTO `history` VALUES (236, 24, 8, '2024-12-30');
INSERT INTO `history` VALUES (237, 6, 3, '2025-01-01');
INSERT INTO `history` VALUES (238, 42, 16, '2025-01-01');
INSERT INTO `history` VALUES (239, 41, 16, '2025-01-01');
INSERT INTO `history` VALUES (240, 21, 16, '2025-01-01');
INSERT INTO `history` VALUES (241, 16, 16, '2025-01-01');
INSERT INTO `history` VALUES (242, 15, 16, '2025-01-01');
INSERT INTO `history` VALUES (243, 14, 16, '2025-01-01');
INSERT INTO `history` VALUES (244, 13, 16, '2025-01-01');
INSERT INTO `history` VALUES (245, 14, 16, '2025-01-01');
INSERT INTO `history` VALUES (246, 13, 16, '2025-01-01');
INSERT INTO `history` VALUES (247, 5, 16, '2025-01-01');
INSERT INTO `history` VALUES (248, 4, 16, '2025-01-01');
INSERT INTO `history` VALUES (249, 6, 16, '2025-01-01');
INSERT INTO `history` VALUES (250, 7, 16, '2025-01-01');
INSERT INTO `history` VALUES (251, 8, 16, '2025-01-01');
INSERT INTO `history` VALUES (252, 41, 16, '2025-01-01');
INSERT INTO `history` VALUES (253, 41, 16, '2025-01-01');
INSERT INTO `history` VALUES (254, 35, 16, '2025-01-01');
INSERT INTO `history` VALUES (255, 41, 16, '2025-01-01');
INSERT INTO `history` VALUES (256, 41, 16, '2025-01-01');
INSERT INTO `history` VALUES (257, 41, 16, '2025-01-01');
INSERT INTO `history` VALUES (258, 43, 16, '2025-01-01');
INSERT INTO `history` VALUES (259, 43, 16, '2025-01-01');
INSERT INTO `history` VALUES (260, 43, 16, '2025-01-01');
INSERT INTO `history` VALUES (261, 43, 16, '2025-01-01');
INSERT INTO `history` VALUES (262, 43, 16, '2025-01-01');
INSERT INTO `history` VALUES (263, 43, 16, '2025-01-01');
INSERT INTO `history` VALUES (264, 43, 16, '2025-01-01');
INSERT INTO `history` VALUES (265, 43, 16, '2025-01-01');
INSERT INTO `history` VALUES (266, 42, 16, '2025-01-01');
INSERT INTO `history` VALUES (267, 21, 16, '2025-01-01');
INSERT INTO `history` VALUES (268, 6, 16, '2025-01-01');
INSERT INTO `history` VALUES (269, 41, 16, '2025-01-01');
INSERT INTO `history` VALUES (270, 6, 16, '2025-01-01');
INSERT INTO `history` VALUES (271, 7, 16, '2025-01-01');
INSERT INTO `history` VALUES (272, 4, 16, '2025-01-02');
INSERT INTO `history` VALUES (273, 4, 16, '2024-12-31');
INSERT INTO `history` VALUES (274, 4, 16, '2024-12-30');
INSERT INTO `history` VALUES (275, 4, 16, '2024-12-29');
INSERT INTO `history` VALUES (276, 4, 16, '2025-01-03');
INSERT INTO `history` VALUES (277, 4, 16, '2025-01-03');
INSERT INTO `history` VALUES (278, 29, 16, '2025-01-03');
INSERT INTO `history` VALUES (279, 11, 16, '2025-01-03');
INSERT INTO `history` VALUES (280, 7, 16, '2025-01-03');
INSERT INTO `history` VALUES (281, 21, 16, '2025-01-03');
INSERT INTO `history` VALUES (282, 4, 16, '2025-01-03');
INSERT INTO `history` VALUES (283, 14, 16, '2025-01-03');
INSERT INTO `history` VALUES (284, 8, 16, '2025-01-03');
INSERT INTO `history` VALUES (285, 15, 16, '2025-01-03');
INSERT INTO `history` VALUES (286, 41, 16, '2025-01-03');
INSERT INTO `history` VALUES (287, 45, 16, '2025-01-03');
INSERT INTO `history` VALUES (288, 46, 16, '2025-01-03');
INSERT INTO `history` VALUES (289, 46, 16, '2025-01-03');
INSERT INTO `history` VALUES (290, 46, 16, '2025-01-03');
INSERT INTO `history` VALUES (291, 46, 16, '2025-01-03');
INSERT INTO `history` VALUES (292, 46, 16, '2025-01-03');
INSERT INTO `history` VALUES (293, 46, 16, '2025-01-03');
INSERT INTO `history` VALUES (294, 45, 16, '2025-01-03');
INSERT INTO `history` VALUES (295, 29, 16, '2025-01-03');
INSERT INTO `history` VALUES (296, 46, 16, '2025-01-03');
INSERT INTO `history` VALUES (297, 44, 16, '2025-01-03');
INSERT INTO `history` VALUES (298, 44, 16, '2025-01-03');
INSERT INTO `history` VALUES (299, 12, 16, '2025-01-06');
INSERT INTO `history` VALUES (300, 32, 16, '2025-01-06');
INSERT INTO `history` VALUES (301, 26, 16, '2025-01-06');
INSERT INTO `history` VALUES (302, 46, 16, '2025-01-06');
INSERT INTO `history` VALUES (303, 46, 16, '2025-01-06');
INSERT INTO `history` VALUES (304, 5, 16, '2025-01-06');
INSERT INTO `history` VALUES (305, 32, 16, '2025-01-06');
INSERT INTO `history` VALUES (306, 25, 16, '2025-01-06');
INSERT INTO `history` VALUES (307, 15, 16, '2025-01-06');
INSERT INTO `history` VALUES (308, 8, 16, '2025-01-06');
INSERT INTO `history` VALUES (309, 27, 16, '2025-01-06');
INSERT INTO `history` VALUES (310, 44, 16, '2025-01-06');
INSERT INTO `history` VALUES (311, 28, 16, '2025-01-06');
INSERT INTO `history` VALUES (312, 42, 16, '2025-01-06');
INSERT INTO `history` VALUES (313, 12, 16, '2025-01-06');
INSERT INTO `history` VALUES (314, 11, 16, '2025-01-06');
INSERT INTO `history` VALUES (315, 7, 16, '2025-01-06');
INSERT INTO `history` VALUES (316, 41, 16, '2025-01-06');
INSERT INTO `history` VALUES (317, 21, 16, '2025-01-06');
INSERT INTO `history` VALUES (318, 14, 16, '2025-01-06');
INSERT INTO `history` VALUES (319, 16, 16, '2025-01-06');
INSERT INTO `history` VALUES (320, 13, 16, '2025-01-06');
INSERT INTO `history` VALUES (321, 4, 16, '2025-01-06');
INSERT INTO `history` VALUES (322, 6, 16, '2025-01-06');
INSERT INTO `history` VALUES (323, 4, 16, '2025-01-06');
INSERT INTO `history` VALUES (324, 43, 16, '2025-01-06');
INSERT INTO `history` VALUES (325, 26, 16, '2025-01-06');
INSERT INTO `history` VALUES (326, 44, 16, '2025-01-06');
INSERT INTO `history` VALUES (327, 14, 16, '2025-01-08');
INSERT INTO `history` VALUES (328, 4, 16, '2025-01-08');
INSERT INTO `history` VALUES (329, 13, 16, '2025-01-08');
INSERT INTO `history` VALUES (330, 11, 16, '2025-01-08');
INSERT INTO `history` VALUES (331, 8, 16, '2025-01-08');
INSERT INTO `history` VALUES (332, 12, 16, '2025-01-08');
INSERT INTO `history` VALUES (333, 7, 16, '2025-01-08');
INSERT INTO `history` VALUES (334, 5, 16, '2025-01-08');
INSERT INTO `history` VALUES (335, 21, 16, '2025-01-08');
INSERT INTO `history` VALUES (336, 15, 16, '2025-01-08');
INSERT INTO `history` VALUES (337, 48, 16, '2025-01-08');
INSERT INTO `history` VALUES (338, 6, 16, '2025-01-08');
INSERT INTO `history` VALUES (339, 16, 16, '2025-01-08');
INSERT INTO `history` VALUES (340, 21, 24, '2025-01-08');
INSERT INTO `history` VALUES (341, 8, 24, '2025-01-08');
INSERT INTO `history` VALUES (342, 7, 24, '2025-01-08');
INSERT INTO `history` VALUES (343, 6, 24, '2025-01-08');
INSERT INTO `history` VALUES (344, 13, 24, '2025-01-08');
INSERT INTO `history` VALUES (345, 16, 24, '2025-01-08');
INSERT INTO `history` VALUES (346, 28, 16, '2025-01-08');
INSERT INTO `history` VALUES (347, 42, 16, '2025-01-08');
INSERT INTO `history` VALUES (348, 46, 16, '2025-01-08');
INSERT INTO `history` VALUES (349, 29, 16, '2025-01-08');
INSERT INTO `history` VALUES (350, 45, 16, '2025-01-08');
INSERT INTO `history` VALUES (351, 30, 16, '2025-01-08');
INSERT INTO `history` VALUES (352, 46, 24, '2025-01-08');
INSERT INTO `history` VALUES (353, 45, 24, '2025-01-08');
INSERT INTO `history` VALUES (354, 4, 16, '2025-01-08');
INSERT INTO `history` VALUES (355, 46, 16, '2025-01-08');
INSERT INTO `history` VALUES (356, 42, 16, '2025-01-08');

-- ----------------------------
-- Table structure for operator
-- ----------------------------
DROP TABLE IF EXISTS `operator`;
CREATE TABLE `operator`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `operator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `isexit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operator
-- ----------------------------
INSERT INTO `operator` VALUES (1, '美国特斯拉', '3', 'true');
INSERT INTO `operator` VALUES (2, '中国比亚迪', '3', 'true');
INSERT INTO `operator` VALUES (3, '中国台湾台积电', '3', 'true');
INSERT INTO `operator` VALUES (4, '中国宁德时代', '3', 'true');
INSERT INTO `operator` VALUES (5, '东亚日本新能源', '3', 'true');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int unsigned NOT NULL COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '昵称',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '邮箱',
  `user_pic` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '头像',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户权限',
  `isclose` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'wangba', '972a3d48ffe4e286930d1c059b4fab31', 'wb', '22222@X.com', 'https://mbd.baidu.com/newspage/data.jpg', '2024-12-19 18:44:09', '2024-12-20 15:41:13', '创作者', NULL);
INSERT INTO `user` VALUES (2, 'testuser', 'e10adc3949ba59abbe56e057f20f883e', 'iu', '', '', '2024-12-23 19:13:28', '2024-12-23 19:13:28', '创作者', NULL);
INSERT INTO `user` VALUES (3, 'lacan', '972a3d48ffe4e286930d1c059b4fab31', 'lazi', '', 'http://localhost:8080/avatar/f1564984-7558-478d-9b9a-a175d7bcf2c2.png', '2024-12-23 19:24:06', '2025-06-25 12:00:17', '创作者', NULL);
INSERT INTO `user` VALUES (4, 'lilili', '1a100d2c0dab19c4430e7d73762b3423', 'mike', '', '', '2024-12-23 19:58:00', '2024-12-23 19:58:00', '创作者', NULL);
INSERT INTO `user` VALUES (5, 'admin', '972a3d48ffe4e286930d1c059b4fab31', '', '', '', '2024-12-24 16:50:58', '2024-12-24 16:50:58', '管理员', NULL);
INSERT INTO `user` VALUES (6, '老舍的小院', 'e10adc3949ba59abbe56e057f20f883e', 'laoshe', '', '', '2024-12-25 18:38:42', '2024-12-25 18:38:42', '创作者', NULL);
INSERT INTO `user` VALUES (7, 'zzzzz', '972a3d48ffe4e286930d1c059b4fab31', 'zhihu', '', '', '2024-12-25 19:16:57', '2024-12-25 19:16:57', '创作者', NULL);
INSERT INTO `user` VALUES (8, 'reader', '972a3d48ffe4e286930d1c059b4fab31', 'Dear', '', '', '2024-12-26 08:59:40', '2025-01-07 17:07:43', '普通用户', 'true');
INSERT INTO `user` VALUES (9, 'blueMan', '972a3d48ffe4e286930d1c059b4fab31', '', '', '', '2024-12-30 10:50:53', '2024-12-30 10:50:53', '创作者', NULL);
INSERT INTO `user` VALUES (10, 'aoyin', '972a3d48ffe4e286930d1c059b4fab31', '', '', '', '2024-12-30 15:01:46', '2024-12-30 15:01:46', '创作者', NULL);
INSERT INTO `user` VALUES (11, '尼采的小屋', '972a3d48ffe4e286930d1c059b4fab31', 'nieche', '', 'http://localhost:8080/avatar/0a0e8722-5f38-40c1-a8ed-b8bd10d0a960.png', '2024-12-30 16:05:43', '2024-12-31 16:07:01', '创作者', NULL);
INSERT INTO `user` VALUES (12, '叔本华的猫', '972a3d48ffe4e286930d1c059b4fab31', 'schoben', '', 'http://localhost:8080/avatar/3dd1140b-eec2-45f2-aa67-2f64e21026ed.jpg', '2024-12-30 16:07:28', '2024-12-31 16:07:50', '创作者', NULL);
INSERT INTO `user` VALUES (13, '齐泽克黑话', '972a3d48ffe4e286930d1c059b4fab31', 'zizik', '', 'http://localhost:8080/avatar/9f1ed1d6-122a-4b20-a360-2b10a8180f2a.jpg', '2024-12-30 16:09:34', '2024-12-31 16:08:32', '创作者', NULL);
INSERT INTO `user` VALUES (14, '热心网友1', '972a3d48ffe4e286930d1c059b4fab31', '', '', '', '2024-12-30 19:54:00', '2024-12-30 19:54:00', '普通用户', NULL);
INSERT INTO `user` VALUES (15, '神评王中王', '972a3d48ffe4e286930d1c059b4fab31', '', '', '', '2024-12-30 20:49:42', '2024-12-30 20:49:42', '普通用户', NULL);
INSERT INTO `user` VALUES (16, 'baobao', '972a3d48ffe4e286930d1c059b4fab31', '', '', 'http://localhost:8080/avatar/b95b7c1d-44de-4191-a9a9-d1cda7c57e0b.png', '2024-12-31 15:45:47', '2024-12-31 15:49:27', '普通用户', NULL);
INSERT INTO `user` VALUES (17, 'faker', '972a3d48ffe4e286930d1c059b4fab31', '', '', 'http://localhost:8080/avatar/c5c92bd2-b94e-4d0f-bd12-8259a8d84520.jpg', '2025-01-01 21:08:45', '2025-01-01 21:14:00', '创作者', NULL);
INSERT INTO `user` VALUES (18, '科比劳大nb', '972a3d48ffe4e286930d1c059b4fab31', '', '', 'http://localhost:8080/avatar/e55f92b1-78b7-4237-8db1-17460f561fe6.jpg', '2025-01-01 22:12:50', '2025-01-06 15:17:37', '创作者', NULL);
INSERT INTO `user` VALUES (19, 'superadmin', '972a3d48ffe4e286930d1c059b4fab31', '', '', 'http://localhost:8080/avatar/24843bd9-ab17-4bc8-b16f-184ae701d9e1.jpg', '2025-01-02 20:43:28', '2025-01-02 20:44:45', '超级管理员', NULL);
INSERT INTO `user` VALUES (20, 'admin2', '20050218', '', '', '', '2025-01-02 21:47:56', '2025-01-02 21:52:00', '管理员', NULL);
INSERT INTO `user` VALUES (21, 'admin3', '20050218', '', '', '', '2025-01-02 21:48:54', '2025-01-02 21:48:54', '管理员', NULL);
INSERT INTO `user` VALUES (22, '物自体666', '972a3d48ffe4e286930d1c059b4fab31', '', '', '', '2025-01-03 08:29:19', '2025-01-03 08:29:19', '普通用户', NULL);
INSERT INTO `user` VALUES (23, '重生之我是101', '972a3d48ffe4e286930d1c059b4fab31', '', '', '', '2025-01-03 10:13:06', '2025-01-03 10:13:06', '普通用户', NULL);
INSERT INTO `user` VALUES (24, 'user001', '972a3d48ffe4e286930d1c059b4fab31', '', '', '', '2025-01-03 14:24:28', '2025-01-03 14:24:28', '普通用户', NULL);
INSERT INTO `user` VALUES (25, 'newadmin', '20050218', '', '', '', '2025-01-07 17:19:42', '2025-01-07 17:19:42', '管理员', NULL);

-- ----------------------------
-- Procedure structure for InsertNewArticleData
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertNewArticleData`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertNewArticleData`()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE article_id INT;
    DECLARE cur CURSOR FOR SELECT id FROM article;  -- 获取所有文章的id
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO article_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- 插入新数据
        INSERT INTO articledata (articleid, time, browse)
        VALUES (article_id, CURDATE(), 0);  -- CURDATE() 获取当前日期

    END LOOP;

    CLOSE cur;
END
;;
delimiter ;

-- ----------------------------
-- Event structure for insert_article_data_for_new_day
-- ----------------------------
DROP EVENT IF EXISTS `insert_article_data_for_new_day`;
delimiter ;;
CREATE DEFINER = `root`@`localhost` EVENT `insert_article_data_for_new_day`
ON SCHEDULE
EVERY '1' DAY STARTS '2024-12-28 00:00:00'
DO BEGIN
    -- 插入每篇文章的浏览量数据（browse为0，time为当天日期）
    INSERT INTO articledata (articleid, time, browse)
    SELECT id, CURDATE(), 0
    FROM article
    WHERE NOT EXISTS (
      SELECT 1
      FROM articledata
      WHERE articledata.articleid = article.id
      AND articledata.time = CURDATE()
    );
  END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
