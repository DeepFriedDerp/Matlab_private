function [aeroForces] = paramSpace_11_1_4_1_1_2_1(sailStates,airStates)

	CL = (5.219336)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.082582)*sailStates.p + (33.494743)*sailStates.q + (1.975904)*sailStates.r + (0.011162)*sailStates.de;
	CD = -1.006270;
	CY = (-0.288620)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.870082)*sailStates.p + (-0.768919)*sailStates.q + (-0.091531)*sailStates.r + (-0.000164)*sailStates.de;

	Cl = (1.537188)*sailStates.alpha + (-0.404071)*sailStates.beta + (-0.792948)*sailStates.p + (6.623895)*sailStates.q + (1.720380)*sailStates.r + (-0.000355)*sailStates.de;
	Cm = (-13.514820)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.328225)*sailStates.p + (-122.164581)*sailStates.q + (-6.682160)*sailStates.r + (-0.068317)*sailStates.de;
	Cn = (1.057335)*sailStates.alpha + (0.042470)*sailStates.beta + (-1.854310)*sailStates.p + (8.682038)*sailStates.q + (0.022635)*sailStates.r + (0.000343)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end