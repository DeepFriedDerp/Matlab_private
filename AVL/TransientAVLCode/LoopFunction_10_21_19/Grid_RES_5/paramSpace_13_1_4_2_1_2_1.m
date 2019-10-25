function [aeroForces] = paramSpace_13_1_4_2_1_2_1(sailStates,airStates)

	CL = (4.182704)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.319888)*sailStates.p + (35.320381)*sailStates.q + (1.465211)*sailStates.r + (0.010869)*sailStates.de;
	CD = -0.149070;
	CY = (-0.081373)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.512191)*sailStates.p + (-0.261302)*sailStates.q + (-0.090341)*sailStates.r + (-0.000055)*sailStates.de;

	Cl = (1.264853)*sailStates.alpha + (-0.245674)*sailStates.beta + (-1.008672)*sailStates.p + (8.732028)*sailStates.q + (1.168301)*sailStates.r + (0.000038)*sailStates.de;
	Cm = (-13.042805)*sailStates.alpha + (0.000000)*sailStates.beta + (7.186867)*sailStates.p + (-129.217163)*sailStates.q + (-4.923184)*sailStates.r + (-0.067754)*sailStates.de;
	Cn = (0.233068)*sailStates.alpha + (0.043319)*sailStates.beta + (-0.992342)*sailStates.p + (4.059058)*sailStates.q + (0.000084)*sailStates.r + (0.000135)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end