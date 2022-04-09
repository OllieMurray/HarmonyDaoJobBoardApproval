pragma solidity ^0.8.4;

contract JobPostings {
    struct DaoJob {
        string text;
        bool approved;
        //other meta data we may want to include with the job posting..
    }

    // An array of 'Todo' structs
    DaoJob[] public daoJobs;

    function create(string memory _text) public {
        // 3 ways to initialize a struct
        // - calling it like a function
        daoJobs.push(DaoJob(_text, false));

        // initialize an empty struct and then update it
        DaoJob memory daoJob;
        daoJob.text = _text;
        // todo.completed initialized to false

        daoJobs.push(daoJob);
    }


    function get(uint _index) public view returns (string memory text, bool completed) {
        DaoJob storage daoJob = daoJobs[_index];
        return (daoJob.text, daoJob.approved);
    }

    // update text
    function update(uint _index, string memory _text) public {
        DaoJob storage todo = daoJobs[_index];
        todo.text = _text;
    }

    // update completed
    function toggleCompleted(uint _index) public {
        DaoJob storage todo = daoJobs[_index];
        todo.approved = !todo.approved;
    }
}