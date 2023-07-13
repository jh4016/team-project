import 'dart:ui';
import 'package:flutter/material.dart';

class TeamMember {
  final String name;
  final String mbti;
  final String description;
  final String merit;
  final String style;
  final BoxDecoration backgroundColor;
  final String image;

  TeamMember({
    required this.name,
    required this.mbti,
    required this.description,
    required this.merit,
    required this.style,
    required this.backgroundColor,
    required this.image,
  });
}

List<TeamMember> teamMembers = [
  TeamMember(
    backgroundColor: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFE8F1FF), // 그라데이션 색상 1
          Color(0xFF535B54), // 그라데이션 색상 2
        ],
      ),
    ),
    image: 'assets/images/img1.png',
    name: '이진혁',
    mbti: 'INFJ',
    description: '사교성이 좋고 낯가림이 없는 INFJ입니다.',
    merit: '남에게 피해주기를 싫어해서 무언가 주어지면 열심히 하며 성격 또한 솔직합니다',
    style: '의견을 많이 나누면서 브레인스토밍하는걸 추구합니다.',
  ),
  TeamMember(
    backgroundColor: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFE5D8C2), // 그라데이션 색상 1
          Color(0xFFD02EA2), // 그라데이션 색상 2
        ],
      ),
    ),
    image: 'assets/images/img2.png',
    name: '신민지',
    mbti: 'ISFP',
    description: '저는 신민지이고, MBTI는 ISFP입니다.',
    merit: '낯은 좀 가리지만 밝고 긍정적인 성격이며 솔직한 성격입니다.',
    style: '최대한 다른 사람의 의견을 수용하면서 소통을 하려고 합니다.',
  ),
  TeamMember(
    backgroundColor: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF7895C0), // 그라데이션 색상 1
          Color(0xFF7E5B38), // 그라데이션 색상 2
        ],
      ),
    ),
    image: 'assets/images/img5.png',
    name: '양화진',
    mbti: 'idk',
    description: '코딩, 개발 관련 교육은 처음입니다. MBTI 검사는 한 번도 안해봤습니다.',
    merit: '초반에 낯을 조금 가리는 편이나 금방 익숙해지며 적응을 잘합니다.',
    style: '의견을 주시면 거기에 살을 붙이는 식으로 채워넣기를 잘 합니다.',
  ),
  TeamMember(
    backgroundColor: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF1E2870), // 그라데이션 색상 1
          Color(0xFF9C9EB9), // 그라데이션 색상 2
        ],
      ),
    ),
    image: 'assets/images/img4.png',
    name: '이수진',
    mbti: 'INTP',
    description: 'INTP인데, 반반 나오는 것도 있어서 MBTI를 그렇게 믿지는 않습니다.',
    merit: '회복 탄력성이 빠른 편입니다.',
    style: '팀원의 의견을 중요시하고 맡은 몫은 끝까지 해내려 합니다.',
  ),
  TeamMember(
    backgroundColor: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFA232C7), // 그라데이션 색상 1
          Color(0xFF71D784), // 그라데이션 색상 2
        ],
      ),
    ),
    image: 'assets/images/img3.png',
    name: '윤승재',
    mbti: 'unexpected',
    description: '저는 예측할 수 없는 사람입니다. MBTI는 저를 완전히 담아내지 못합니다.',
    merit: '성실함(공부를 오래 해도 지치지 않음), 책임감(내가 맡은 문제는 밤을 새서라도 해결함)',
    style: '도움이 필요하실 때 말씀하시면 책임감 가지고 해결이 될 때까지 도와드리겠습니다.',
  ),
];
