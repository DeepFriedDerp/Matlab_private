function [aeroForces] = paramSpace_4_2_2_2_1_2_2(sailStates,airStates)

	CL = (4.003800)*sailStates.alpha + (0.074312)*sailStates.beta + (-2.458187)*sailStates.p + (35.382366)*sailStates.q + (1.175771)*sailStates.r + (0.010675)*sailStates.de;
	CD = 0.030120;
	CY = (-0.098261)*sailStates.alpha + (-0.025754)*sailStates.beta + (0.334638)*sailStates.p + (-0.756270)*sailStates.q + (-0.066537)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.318805)*sailStates.alpha + (-0.111525)*sailStates.beta + (-1.165142)*sailStates.p + (10.143586)*sailStates.q + (0.827655)*sailStates.r + (0.000324)*sailStates.de;
	Cm = (-13.840740)*sailStates.alpha + (-0.255082)*sailStates.beta + (7.917357)*sailStates.p + (-133.768066)*sailStates.q + (-3.915029)*sailStates.r + (-0.067580)*sailStates.de;
	Cn = (0.003637)*sailStates.alpha + (0.027289)*sailStates.beta + (-0.547971)*sailStates.p + (2.356525)*sailStates.q + (-0.009608)*sailStates.r + (0.000263)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end