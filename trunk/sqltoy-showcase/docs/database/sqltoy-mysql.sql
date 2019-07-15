alter table SQLTOY_DICT_DETAIL 
   drop foreign key FK_SQLTOY_D_REFERENCE_SQLTOY_D;

drop table if exists SQLTOY_AREA_INFO;


alter table SQLTOY_DICT_DETAIL 
   drop foreign key FK_SQLTOY_D_REFERENCE_SQLTOY_D;

drop table if exists SQLTOY_DICT_DETAIL;

drop table if exists SQLTOY_DICT_TYPE;

drop table if exists SQLTOY_ORGAN_INFO;

drop table if exists SQLTOY_STAFF_AUTH_ORGS;

drop table if exists SQLTOY_STAFF_INFO;

drop table if exists SQLTOY_TRANS_INFO_15D;

drop table if exists SQLTOY_TRANS_INFO_HIS;

drop table if exists SQLTOY_USER_LOG;

/*==============================================================*/
/* Table: SQLTOY_AREA_INFO                                      */
/*==============================================================*/
create table SQLTOY_AREA_INFO
(
   AREA_CODE            varchar(10) not null  comment '��������',
   AREA_NAME            varchar(30) not null  comment '��������',
   AREA_TEL             varchar(10)  comment '����',
   AREA_PID             varchar(10) not null  comment '����������',
   ENGLISH_NAME         varchar(100)  comment 'Ӣ�ļ��',
   INITIAL              char(1)  comment '����ĸ',
   COUNTRY_CODE         varchar(10)  comment '���Ҵ���',
   CITY_CODE            varchar(10)  comment '���ڳ���',
   CITY_NAME            varchar(30)  comment '��������',
   PROVINCE_CODE        varchar(10)  comment '����ʡ��',
   PROVINCE_NAME        varchar(30)  comment 'ʡ������',
   FULL_NAME            varchar(100)  comment '��������',
   LONGITUDE            decimal(10,5)  comment '����',
   LATITUDE             decimal(10,5)  comment 'ά��',
   NODE_ROUTE           varchar(200) not null  comment '�ڵ�·��',
   NODE_LEVEL           numeric(1) not null  comment '�ڵ�ȼ�',
   IS_LEAF              numeric(1) not null  comment '�Ƿ�Ҷ�ӽڵ�',
   SHOW_INDEX           numeric(8) not null default 1  comment '��ʾ˳��',
   STATUS               decimal(1) not null default 1  comment '״̬',
   primary key (AREA_CODE)
);

alter table SQLTOY_AREA_INFO comment '���������';

/*==============================================================*/
/* Table: SQLTOY_DICT_DETAIL                                    */
/*==============================================================*/
create table SQLTOY_DICT_DETAIL
(
   DICT_KEY             varchar(50) not null  comment '�ֵ�KEY',
   DICT_TYPE            varchar(50) not null  comment '�ֵ����ʹ���',
   DICT_NAME            varchar(200) not null  comment '�ֵ�ֵ',
   SHOW_INDEX           numeric(8) not null default 1  comment '��ʾ˳��',
   UPDATE_BY            varchar(22) not null  comment '����޸���',
   UPDATE_TIME          datetime not null  comment '����޸�ʱ��',
   STATUS               decimal(1) not null default 1  comment '״̬',
   primary key (DICT_KEY, DICT_TYPE)
);

alter table SQLTOY_DICT_DETAIL comment '�ֵ���ϸ��';

/*==============================================================*/
/* Table: SQLTOY_DICT_TYPE                                      */
/*==============================================================*/
create table SQLTOY_DICT_TYPE
(
   DICT_TYPE            varchar(50) not null  comment '�ֵ����ʹ���',
   DICT_TYPE_NAME       varchar(100) not null  comment '�ֵ���������',
   COMMENTS             varchar(500)  comment '˵��',
   SHOW_INDEX           numeric(8) not null default 1  comment '��ʾ˳��',
   CREATE_BY            varchar(22) not null  comment '������',
   CREATE_TIME          datetime not null  comment '����ʱ��',
   UPDATE_BY            varchar(22) not null  comment '����޸���',
   UPDATE_TIME          datetime not null  comment '����޸�ʱ��',
   STATUS               decimal(1) not null default 1  comment '״̬',
   primary key (DICT_TYPE)
);

alter table SQLTOY_DICT_TYPE comment '�ֵ�����';

/*==============================================================*/
/* Table: SQLTOY_ORGAN_INFO                                     */
/*==============================================================*/
create table SQLTOY_ORGAN_INFO
(
   ORGAN_ID             varchar(22) not null  comment '����ID',
   ORGAN_NAME           varchar(100) not null  comment '��������',
   ORGAN_CODE           varchar(20) not null  comment '��������',
   COST_NO              varchar(20)  comment '�ɱ����Ĵ���',
   ORGAN_PID            varchar(22) not null  comment '������ID',
   NODE_ROUTE           varchar(200) not null  comment '�ڵ�·��',
   NODE_LEVEL           numeric(1) not null  comment '�ڵ�ȼ�',
   IS_LEAF              numeric(1) not null  comment '�Ƿ�Ҷ�ӽڵ�',
   SHOW_INDEX           numeric(8) not null default 1  comment '��ʾ˳��',
   CREATE_BY            varchar(22) not null  comment '������',
   CREATE_TIME          datetime not null  comment '����ʱ��',
   UPDATE_BY            varchar(22) not null  comment '����޸���',
   UPDATE_TIME          datetime not null  comment '����޸�ʱ��',
   STATUS               decimal(1) not null default 1  comment '״̬',
   primary key (ORGAN_ID)
);

alter table SQLTOY_ORGAN_INFO comment '������Ϣ��';

/*==============================================================*/
/* Table: SQLTOY_STAFF_AUTH_ORGS                                */
/*==============================================================*/
create table SQLTOY_STAFF_AUTH_ORGS
(
   AUTH_ID              varchar(22) not null  comment '��ȨID',
   STAFF_ID             varchar(22) not null  comment 'Ա��ID',
   ORGAN_ID             varchar(22) not null  comment '����ID',
   SHOW_INDEX           numeric(8) not null default 1  comment '��ʾ˳��',
   CREATE_BY            varchar(22) not null  comment '������',
   CREATE_TIME          datetime not null  comment '����ʱ��',
   UPDATE_BY            varchar(22) not null  comment '����޸���',
   UPDATE_TIME          datetime not null  comment '����޸�ʱ��',
   STATUS               decimal(1) not null default 1  comment '״̬',
   primary key (AUTH_ID)
);

alter table SQLTOY_STAFF_AUTH_ORGS comment 'Ա��������Ȩ��';

/*==============================================================*/
/* Table: SQLTOY_STAFF_INFO                                     */
/*==============================================================*/
create table SQLTOY_STAFF_INFO
(
   STAFF_ID             varchar(22) not null  comment 'Ա��ID',
   STAFF_CODE           varchar(22) not null  comment '����',
   STAFF_NAME           varchar(30) not null  comment '����',
   ORGAN_ID             varchar(22) not null  comment '����',
   SEX_TYPE             char(1) not null  comment '�Ա�',
   ENTRY_DATE           date not null  comment '��ְ����',
   TERM_DATE            date  comment '��ְ����',
   PHOTO                longblob  comment '��Ƭ',
   COUNTRY              varchar(10)  comment '����',
   CENSUS_REGISTER      varchar(150)  comment '����',
   ADDRESS              varchar(250)  comment '��ͥ��ַ',
   EMAIL                varchar(100)  comment '����',
   TEL_NO               varchar(20)  comment '�ƶ��绰',
   POST                 varchar(20)  comment '��λ',
   POST_GRADE           varchar(20)  comment 'ְλ����',
   CREATE_BY            varchar(22) not null  comment '������',
   CREATE_TIME          datetime not null  comment '����ʱ��',
   UPDATE_BY            varchar(22) not null  comment '����޸���',
   UPDATE_TIME          datetime not null  comment '����޸�ʱ��',
   STATUS               decimal(1) not null default 1  comment '״̬',
   primary key (STAFF_ID)
);

alter table SQLTOY_STAFF_INFO comment 'Ա����Ϣ��';

/*==============================================================*/
/* Table: SQLTOY_TRANS_INFO_15D                                 */
/*==============================================================*/
create table SQLTOY_TRANS_INFO_15D
(
   TRANS_ID             varchar(32) not null  comment '����ID',
   TRANS_CODE           varchar(20) not null  comment '���״���',
   TRANS_CHANNEL        varchar(20) not null  comment '��������',
   TRANS_AMT            decimal(14,2) not null  comment '���׽��',
   STATUS               decimal(1) not null  comment '����״̬',
   RESULT_CODE          varchar(20) not null  comment '���׷�����',
   TRANS_TIME           datetime not null  comment '����ʱ��',
   TRANS_DATE           date not null  comment '��������',
   USER_ID              varchar(32) not null  comment '�û�ID',
   CARD_NO              varchar(32)  comment '���׿���',
   primary key (TRANS_ID)
);

alter table SQLTOY_TRANS_INFO_15D comment '֧��������ˮ��(15���)';

/*==============================================================*/
/* Table: SQLTOY_TRANS_INFO_HIS                                 */
/*==============================================================*/
create table SQLTOY_TRANS_INFO_HIS
(
   TRANS_ID             varchar(32) not null  comment '����ID',
   TRANS_CODE           varchar(20) not null  comment '���״���',
   TRANS_CHANNEL        varchar(20) not null  comment '��������',
   AMT                  decimal(14,2) not null  comment '���׽��',
   STATUS               decimal(1) not null  comment '����״̬',
   RESULT_CODE          varchar(20) not null  comment '���׷�����',
   TRANS_TIME           datetime not null  comment '����ʱ��',
   TRANS_DATE           date not null  comment '��������',
   USER_ID              varchar(32) not null  comment '�û�ID',
   CARD_NO              varchar(32)  comment '���׿���',
   primary key (TRANS_ID)
);

alter table SQLTOY_TRANS_INFO_HIS comment '֧��������ˮ��';

/*==============================================================*/
/* Table: SQLTOY_USER_LOG                                       */
/*==============================================================*/
create table SQLTOY_USER_LOG
(
   LOG_ID               varchar(32) not null  comment '��־ID',
   USER_ID              varchar(32) not null  comment '�û�ID',
   TERMINAL_IP          varchar(32)  comment '����IP',
   DEVICE_CODE          varchar(32)  comment '�豸��',
   LOG_TIME             datetime not null  comment '��־ʱ��',
   LOG_DATE             date not null  comment '��������',
   LOG_TYPE             varchar(32) not null  comment '��־����',
   CHANNEL              varchar(32) not null  comment 'Ӧ������',
   CONTENTS             text not null  comment '��־����',
   primary key (LOG_ID)
);

alter table SQLTOY_USER_LOG comment '�û���־��';

alter table SQLTOY_DICT_DETAIL add constraint FK_SQLTOY_D_REFERENCE_SQLTOY_D foreign key (DICT_TYPE)
      references SQLTOY_DICT_TYPE (DICT_TYPE) on delete restrict on update restrict;