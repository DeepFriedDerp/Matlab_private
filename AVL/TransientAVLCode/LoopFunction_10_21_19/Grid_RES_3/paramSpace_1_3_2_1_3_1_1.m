function [aeroForces] = paramSpace_1_3_2_1_3_1_1(sailStates,airStates)

	CL = (7.400590)*sailStates.alpha + (0.642078)*sailStates.beta + (-1.733848)*sailStates.p + (35.067432)*sailStates.q + (-3.243636)*sailStates.r + (0.011592)*sailStates.de;
	CD = -2.994640;
	CY = (0.691868)*sailStates.alpha + (-0.022105)*sailStates.beta + (-1.405862)*sailStates.p + (1.081937)*sailStates.q + (-0.247891)*sailStates.r + (0.000225)*sailStates.de;

	Cl = (2.228853)*sailStates.alpha + (0.833693)*sailStates.beta + (-0.440091)*sailStates.p + (4.502505)*sailStates.q + (-2.781398)*sailStates.r + (-0.000988)*sailStates.de;
	Cm = (-10.934644)*sailStates.alpha + (-2.420421)*sailStates.beta + (3.640759)*sailStates.p + (-108.520645)*sailStates.q + (10.758831)*sailStates.r + (-0.065097)*sailStates.de;
	Cn = (-2.722679)*sailStates.alpha + (0.102741)*sailStates.beta + (3.117698)*sailStates.p + (-14.905980)*sailStates.q + (0.072982)*sailStates.r + (-0.000503)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end