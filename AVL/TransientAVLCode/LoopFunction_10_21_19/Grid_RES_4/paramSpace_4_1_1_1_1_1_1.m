function [aeroForces] = paramSpace_4_1_1_1_1_1_1(sailStates,airStates)

	CL = (4.732329)*sailStates.alpha + (-0.335816)*sailStates.beta + (-1.390566)*sailStates.p + (20.019876)*sailStates.q + (-1.200207)*sailStates.r + (0.008678)*sailStates.de;
	CD = -1.647000;
	CY = (0.148758)*sailStates.alpha + (-0.027664)*sailStates.beta + (-0.673880)*sailStates.p + (-1.002334)*sailStates.q + (0.134151)*sailStates.r + (-0.000207)*sailStates.de;

	Cl = (0.468195)*sailStates.alpha + (0.287923)*sailStates.beta + (-0.417950)*sailStates.p + (1.677436)*sailStates.q + (-1.371765)*sailStates.r + (-0.000755)*sailStates.de;
	Cm = (-14.923398)*sailStates.alpha + (1.419370)*sailStates.beta + (6.271431)*sailStates.p + (-107.565659)*sailStates.q + (3.936876)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (-1.351191)*sailStates.alpha + (-0.079626)*sailStates.beta + (1.605608)*sailStates.p + (-6.374065)*sailStates.q + (-0.030518)*sailStates.r + (0.000170)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end