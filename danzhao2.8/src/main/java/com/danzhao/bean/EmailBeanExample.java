package com.danzhao.bean;

import java.util.ArrayList;
import java.util.List;

public class EmailBeanExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public EmailBeanExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andEmailuseridIsNull() {
            addCriterion("emailUserId is null");
            return (Criteria) this;
        }

        public Criteria andEmailuseridIsNotNull() {
            addCriterion("emailUserId is not null");
            return (Criteria) this;
        }

        public Criteria andEmailuseridEqualTo(Integer value) {
            addCriterion("emailUserId =", value, "emailuserid");
            return (Criteria) this;
        }

        public Criteria andEmailuseridNotEqualTo(Integer value) {
            addCriterion("emailUserId <>", value, "emailuserid");
            return (Criteria) this;
        }

        public Criteria andEmailuseridGreaterThan(Integer value) {
            addCriterion("emailUserId >", value, "emailuserid");
            return (Criteria) this;
        }

        public Criteria andEmailuseridGreaterThanOrEqualTo(Integer value) {
            addCriterion("emailUserId >=", value, "emailuserid");
            return (Criteria) this;
        }

        public Criteria andEmailuseridLessThan(Integer value) {
            addCriterion("emailUserId <", value, "emailuserid");
            return (Criteria) this;
        }

        public Criteria andEmailuseridLessThanOrEqualTo(Integer value) {
            addCriterion("emailUserId <=", value, "emailuserid");
            return (Criteria) this;
        }

        public Criteria andEmailuseridIn(List<Integer> values) {
            addCriterion("emailUserId in", values, "emailuserid");
            return (Criteria) this;
        }

        public Criteria andEmailuseridNotIn(List<Integer> values) {
            addCriterion("emailUserId not in", values, "emailuserid");
            return (Criteria) this;
        }

        public Criteria andEmailuseridBetween(Integer value1, Integer value2) {
            addCriterion("emailUserId between", value1, value2, "emailuserid");
            return (Criteria) this;
        }

        public Criteria andEmailuseridNotBetween(Integer value1, Integer value2) {
            addCriterion("emailUserId not between", value1, value2, "emailuserid");
            return (Criteria) this;
        }

        public Criteria andSendaccountIsNull() {
            addCriterion("sendAccount is null");
            return (Criteria) this;
        }

        public Criteria andSendaccountIsNotNull() {
            addCriterion("sendAccount is not null");
            return (Criteria) this;
        }

        public Criteria andSendaccountEqualTo(String value) {
            addCriterion("sendAccount =", value, "sendaccount");
            return (Criteria) this;
        }

        public Criteria andSendaccountNotEqualTo(String value) {
            addCriterion("sendAccount <>", value, "sendaccount");
            return (Criteria) this;
        }

        public Criteria andSendaccountGreaterThan(String value) {
            addCriterion("sendAccount >", value, "sendaccount");
            return (Criteria) this;
        }

        public Criteria andSendaccountGreaterThanOrEqualTo(String value) {
            addCriterion("sendAccount >=", value, "sendaccount");
            return (Criteria) this;
        }

        public Criteria andSendaccountLessThan(String value) {
            addCriterion("sendAccount <", value, "sendaccount");
            return (Criteria) this;
        }

        public Criteria andSendaccountLessThanOrEqualTo(String value) {
            addCriterion("sendAccount <=", value, "sendaccount");
            return (Criteria) this;
        }

        public Criteria andSendaccountLike(String value) {
            addCriterion("sendAccount like", value, "sendaccount");
            return (Criteria) this;
        }

        public Criteria andSendaccountNotLike(String value) {
            addCriterion("sendAccount not like", value, "sendaccount");
            return (Criteria) this;
        }

        public Criteria andSendaccountIn(List<String> values) {
            addCriterion("sendAccount in", values, "sendaccount");
            return (Criteria) this;
        }

        public Criteria andSendaccountNotIn(List<String> values) {
            addCriterion("sendAccount not in", values, "sendaccount");
            return (Criteria) this;
        }

        public Criteria andSendaccountBetween(String value1, String value2) {
            addCriterion("sendAccount between", value1, value2, "sendaccount");
            return (Criteria) this;
        }

        public Criteria andSendaccountNotBetween(String value1, String value2) {
            addCriterion("sendAccount not between", value1, value2, "sendaccount");
            return (Criteria) this;
        }

        public Criteria andRecipientaccountIsNull() {
            addCriterion("recipientAccount is null");
            return (Criteria) this;
        }

        public Criteria andRecipientaccountIsNotNull() {
            addCriterion("recipientAccount is not null");
            return (Criteria) this;
        }

        public Criteria andRecipientaccountEqualTo(String value) {
            addCriterion("recipientAccount =", value, "recipientaccount");
            return (Criteria) this;
        }

        public Criteria andRecipientaccountNotEqualTo(String value) {
            addCriterion("recipientAccount <>", value, "recipientaccount");
            return (Criteria) this;
        }

        public Criteria andRecipientaccountGreaterThan(String value) {
            addCriterion("recipientAccount >", value, "recipientaccount");
            return (Criteria) this;
        }

        public Criteria andRecipientaccountGreaterThanOrEqualTo(String value) {
            addCriterion("recipientAccount >=", value, "recipientaccount");
            return (Criteria) this;
        }

        public Criteria andRecipientaccountLessThan(String value) {
            addCriterion("recipientAccount <", value, "recipientaccount");
            return (Criteria) this;
        }

        public Criteria andRecipientaccountLessThanOrEqualTo(String value) {
            addCriterion("recipientAccount <=", value, "recipientaccount");
            return (Criteria) this;
        }

        public Criteria andRecipientaccountLike(String value) {
            addCriterion("recipientAccount like", value, "recipientaccount");
            return (Criteria) this;
        }

        public Criteria andRecipientaccountNotLike(String value) {
            addCriterion("recipientAccount not like", value, "recipientaccount");
            return (Criteria) this;
        }

        public Criteria andRecipientaccountIn(List<String> values) {
            addCriterion("recipientAccount in", values, "recipientaccount");
            return (Criteria) this;
        }

        public Criteria andRecipientaccountNotIn(List<String> values) {
            addCriterion("recipientAccount not in", values, "recipientaccount");
            return (Criteria) this;
        }

        public Criteria andRecipientaccountBetween(String value1, String value2) {
            addCriterion("recipientAccount between", value1, value2, "recipientaccount");
            return (Criteria) this;
        }

        public Criteria andRecipientaccountNotBetween(String value1, String value2) {
            addCriterion("recipientAccount not between", value1, value2, "recipientaccount");
            return (Criteria) this;
        }

        public Criteria andAuthorizationcodeIsNull() {
            addCriterion("authorizationCode is null");
            return (Criteria) this;
        }

        public Criteria andAuthorizationcodeIsNotNull() {
            addCriterion("authorizationCode is not null");
            return (Criteria) this;
        }

        public Criteria andAuthorizationcodeEqualTo(String value) {
            addCriterion("authorizationCode =", value, "authorizationcode");
            return (Criteria) this;
        }

        public Criteria andAuthorizationcodeNotEqualTo(String value) {
            addCriterion("authorizationCode <>", value, "authorizationcode");
            return (Criteria) this;
        }

        public Criteria andAuthorizationcodeGreaterThan(String value) {
            addCriterion("authorizationCode >", value, "authorizationcode");
            return (Criteria) this;
        }

        public Criteria andAuthorizationcodeGreaterThanOrEqualTo(String value) {
            addCriterion("authorizationCode >=", value, "authorizationcode");
            return (Criteria) this;
        }

        public Criteria andAuthorizationcodeLessThan(String value) {
            addCriterion("authorizationCode <", value, "authorizationcode");
            return (Criteria) this;
        }

        public Criteria andAuthorizationcodeLessThanOrEqualTo(String value) {
            addCriterion("authorizationCode <=", value, "authorizationcode");
            return (Criteria) this;
        }

        public Criteria andAuthorizationcodeLike(String value) {
            addCriterion("authorizationCode like", value, "authorizationcode");
            return (Criteria) this;
        }

        public Criteria andAuthorizationcodeNotLike(String value) {
            addCriterion("authorizationCode not like", value, "authorizationcode");
            return (Criteria) this;
        }

        public Criteria andAuthorizationcodeIn(List<String> values) {
            addCriterion("authorizationCode in", values, "authorizationcode");
            return (Criteria) this;
        }

        public Criteria andAuthorizationcodeNotIn(List<String> values) {
            addCriterion("authorizationCode not in", values, "authorizationcode");
            return (Criteria) this;
        }

        public Criteria andAuthorizationcodeBetween(String value1, String value2) {
            addCriterion("authorizationCode between", value1, value2, "authorizationcode");
            return (Criteria) this;
        }

        public Criteria andAuthorizationcodeNotBetween(String value1, String value2) {
            addCriterion("authorizationCode not between", value1, value2, "authorizationcode");
            return (Criteria) this;
        }

        public Criteria andEmailsmtphostIsNull() {
            addCriterion("emailSMTPHost is null");
            return (Criteria) this;
        }

        public Criteria andEmailsmtphostIsNotNull() {
            addCriterion("emailSMTPHost is not null");
            return (Criteria) this;
        }

        public Criteria andEmailsmtphostEqualTo(String value) {
            addCriterion("emailSMTPHost =", value, "emailsmtphost");
            return (Criteria) this;
        }

        public Criteria andEmailsmtphostNotEqualTo(String value) {
            addCriterion("emailSMTPHost <>", value, "emailsmtphost");
            return (Criteria) this;
        }

        public Criteria andEmailsmtphostGreaterThan(String value) {
            addCriterion("emailSMTPHost >", value, "emailsmtphost");
            return (Criteria) this;
        }

        public Criteria andEmailsmtphostGreaterThanOrEqualTo(String value) {
            addCriterion("emailSMTPHost >=", value, "emailsmtphost");
            return (Criteria) this;
        }

        public Criteria andEmailsmtphostLessThan(String value) {
            addCriterion("emailSMTPHost <", value, "emailsmtphost");
            return (Criteria) this;
        }

        public Criteria andEmailsmtphostLessThanOrEqualTo(String value) {
            addCriterion("emailSMTPHost <=", value, "emailsmtphost");
            return (Criteria) this;
        }

        public Criteria andEmailsmtphostLike(String value) {
            addCriterion("emailSMTPHost like", value, "emailsmtphost");
            return (Criteria) this;
        }

        public Criteria andEmailsmtphostNotLike(String value) {
            addCriterion("emailSMTPHost not like", value, "emailsmtphost");
            return (Criteria) this;
        }

        public Criteria andEmailsmtphostIn(List<String> values) {
            addCriterion("emailSMTPHost in", values, "emailsmtphost");
            return (Criteria) this;
        }

        public Criteria andEmailsmtphostNotIn(List<String> values) {
            addCriterion("emailSMTPHost not in", values, "emailsmtphost");
            return (Criteria) this;
        }

        public Criteria andEmailsmtphostBetween(String value1, String value2) {
            addCriterion("emailSMTPHost between", value1, value2, "emailsmtphost");
            return (Criteria) this;
        }

        public Criteria andEmailsmtphostNotBetween(String value1, String value2) {
            addCriterion("emailSMTPHost not between", value1, value2, "emailsmtphost");
            return (Criteria) this;
        }

        public Criteria andEmailsubjectIsNull() {
            addCriterion("emailSubject is null");
            return (Criteria) this;
        }

        public Criteria andEmailsubjectIsNotNull() {
            addCriterion("emailSubject is not null");
            return (Criteria) this;
        }

        public Criteria andEmailsubjectEqualTo(String value) {
            addCriterion("emailSubject =", value, "emailsubject");
            return (Criteria) this;
        }

        public Criteria andEmailsubjectNotEqualTo(String value) {
            addCriterion("emailSubject <>", value, "emailsubject");
            return (Criteria) this;
        }

        public Criteria andEmailsubjectGreaterThan(String value) {
            addCriterion("emailSubject >", value, "emailsubject");
            return (Criteria) this;
        }

        public Criteria andEmailsubjectGreaterThanOrEqualTo(String value) {
            addCriterion("emailSubject >=", value, "emailsubject");
            return (Criteria) this;
        }

        public Criteria andEmailsubjectLessThan(String value) {
            addCriterion("emailSubject <", value, "emailsubject");
            return (Criteria) this;
        }

        public Criteria andEmailsubjectLessThanOrEqualTo(String value) {
            addCriterion("emailSubject <=", value, "emailsubject");
            return (Criteria) this;
        }

        public Criteria andEmailsubjectLike(String value) {
            addCriterion("emailSubject like", value, "emailsubject");
            return (Criteria) this;
        }

        public Criteria andEmailsubjectNotLike(String value) {
            addCriterion("emailSubject not like", value, "emailsubject");
            return (Criteria) this;
        }

        public Criteria andEmailsubjectIn(List<String> values) {
            addCriterion("emailSubject in", values, "emailsubject");
            return (Criteria) this;
        }

        public Criteria andEmailsubjectNotIn(List<String> values) {
            addCriterion("emailSubject not in", values, "emailsubject");
            return (Criteria) this;
        }

        public Criteria andEmailsubjectBetween(String value1, String value2) {
            addCriterion("emailSubject between", value1, value2, "emailsubject");
            return (Criteria) this;
        }

        public Criteria andEmailsubjectNotBetween(String value1, String value2) {
            addCriterion("emailSubject not between", value1, value2, "emailsubject");
            return (Criteria) this;
        }

        public Criteria andEmailcontentIsNull() {
            addCriterion("emailContent is null");
            return (Criteria) this;
        }

        public Criteria andEmailcontentIsNotNull() {
            addCriterion("emailContent is not null");
            return (Criteria) this;
        }

        public Criteria andEmailcontentEqualTo(String value) {
            addCriterion("emailContent =", value, "emailcontent");
            return (Criteria) this;
        }

        public Criteria andEmailcontentNotEqualTo(String value) {
            addCriterion("emailContent <>", value, "emailcontent");
            return (Criteria) this;
        }

        public Criteria andEmailcontentGreaterThan(String value) {
            addCriterion("emailContent >", value, "emailcontent");
            return (Criteria) this;
        }

        public Criteria andEmailcontentGreaterThanOrEqualTo(String value) {
            addCriterion("emailContent >=", value, "emailcontent");
            return (Criteria) this;
        }

        public Criteria andEmailcontentLessThan(String value) {
            addCriterion("emailContent <", value, "emailcontent");
            return (Criteria) this;
        }

        public Criteria andEmailcontentLessThanOrEqualTo(String value) {
            addCriterion("emailContent <=", value, "emailcontent");
            return (Criteria) this;
        }

        public Criteria andEmailcontentLike(String value) {
            addCriterion("emailContent like", value, "emailcontent");
            return (Criteria) this;
        }

        public Criteria andEmailcontentNotLike(String value) {
            addCriterion("emailContent not like", value, "emailcontent");
            return (Criteria) this;
        }

        public Criteria andEmailcontentIn(List<String> values) {
            addCriterion("emailContent in", values, "emailcontent");
            return (Criteria) this;
        }

        public Criteria andEmailcontentNotIn(List<String> values) {
            addCriterion("emailContent not in", values, "emailcontent");
            return (Criteria) this;
        }

        public Criteria andEmailcontentBetween(String value1, String value2) {
            addCriterion("emailContent between", value1, value2, "emailcontent");
            return (Criteria) this;
        }

        public Criteria andEmailcontentNotBetween(String value1, String value2) {
            addCriterion("emailContent not between", value1, value2, "emailcontent");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}