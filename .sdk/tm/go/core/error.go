package core

type DymoApiIntroductionError struct {
	IsDymoApiIntroductionError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewDymoApiIntroductionError(code string, msg string, ctx *Context) *DymoApiIntroductionError {
	return &DymoApiIntroductionError{
		IsDymoApiIntroductionError: true,
		Sdk:              "DymoApiIntroduction",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *DymoApiIntroductionError) Error() string {
	return e.Msg
}
