# Assignment 1: Design a Logical Model

## Question 1
Create a logical model for a small bookstore. 📚

At the minimum it should have employee, order, sales, customer, and book entities (tables). Determine sensible column and table design based on what you know about these concepts. Keep it simple, but work out sensible relationships to keep tables reasonably sized. Include a date table. There are several tools online you can use, I'd recommend [_Draw.io_](https://www.drawio.com/) or [_LucidChart_](https://www.lucidchart.com/pages/).
![image](https://github.com/luizpveo/sql/assets/57971038/ae47f377-0b49-4c7e-ac50-39462692843e)


## Question 2
We want to create employee shifts, splitting up the day into morning and evening. Add this to the ERD.
![image](https://github.com/luizpveo/sql/assets/57971038/6880d966-f9aa-47ee-ac0e-7984dd01dd6e)

## Question 3
The store wants to keep customer addresses. Propose two architectures for the CUSTOMER_ADDRESS table, one that will retain changes, and another that will overwrite. Which is type 1, which is type 2?

_Hint, search type 1 vs type 2 slowly changing dimensions._

Architecture 1 - Retain changes :
In this model, a new record will be created for the same customer every time they move to a new address, retaining all their previous addresses.


![image](https://github.com/luizpveo/sql/assets/57971038/46c0bf7b-6b9a-409f-8cc2-df1583d88d4e)



Architecture 2 - Overwrite changes:
In this model, no new record will be created for the same customer every time they move to a new address, the last address's record will be overwritten by the new one.


![image](https://github.com/luizpveo/sql/assets/57971038/3253d282-43bb-41a3-a320-244b06934291)


Bonus: Are there privacy implications to this, why or why not?
```
Your answer...
Both architectures would have privacy implication because of the sensitive data (customer's address). Architecture 1 will retain the entire history of the customer's address ,this increases the responsibility for a better data protection compared to the second architecture.
```

## Question 4
Review the AdventureWorks Schema [here](https://i.stack.imgur.com/LMu4W.gif)

Highlight at least two differences between it and your ERD. Would you change anything in yours?
```
Your answer...
1) The use of schemas: I like the way schemas were used in this model.It helps in keeping the data set clean and easy to understand, especially with a lot of tables.
2) The use of small tables instead of big tables: When I am looking the Person schema, I noticed that there is a lot of small tables instead of just 1 big table and It makes sense because I can see some benefits in performance, clarity and maintability for example.

I would change my ERD by breaking my big tables into smaller tables and creating schemas to facilitate visualization
```

# Criteria

[Assignment Rubric](./assignment_rubric.md)

# Submission Information

🚨 **Please review our [Assignment Submission Guide](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md)** 🚨 for detailed instructions on how to format, branch, and submit your work. Following these guidelines is crucial for your submissions to be evaluated correctly.

### Submission Parameters:
* Submission Due Date: `June 1, 2024`
* The branch name for your repo should be: `model-design`
* What to submit for this assignment:
    * This markdown (design_a_logical_model.md) should be populated.
    * Two Entity-Relationship Diagrams (preferably in a pdf, jpeg, png format).
* What the pull request link should look like for this assignment: `https://github.com/<your_github_username>/sql/pull/<pr_id>`
    * Open a private window in your browser. Copy and paste the link to your pull request into the address bar. Make sure you can see your pull request properly. This helps the technical facilitator and learning support staff review your submission easily.

Checklist:
- [ ] Create a branch called `model-design`.
- [ ] Ensure that the repository is public.
- [ ] Review [the PR description guidelines](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md#guidelines-for-pull-request-descriptions) and adhere to them.
- [ ] Verify that the link is accessible in a private browser window.

If you encounter any difficulties or have questions, please don't hesitate to reach out to our team via our Slack at `#cohort-3-help`. Our Technical Facilitators and Learning Support staff are here to help you navigate any challenges.
