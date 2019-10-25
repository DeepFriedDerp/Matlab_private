function [aeroForces] = paramSpace_4_1_3_2_1_1_1(sailStates,airStates)

	CL = (3.915797)*sailStates.alpha + (-0.017666)*sailStates.beta + (-1.974043)*sailStates.p + (28.257109)*sailStates.q + (-0.002340)*sailStates.r + (0.009543)*sailStates.de;
	CD = -0.229680;
	CY = (-0.024311)*sailStates.alpha + (-0.026282)*sailStates.beta + (-0.169236)*sailStates.p + (-0.455226)*sailStates.q + (0.033647)*sailStates.r + (-0.000095)*sailStates.de;

	Cl = (1.010615)*sailStates.alpha + (0.098341)*sailStates.beta + (-0.844925)*sailStates.p + (6.451997)*sailStates.q + (-0.224116)*sailStates.r + (-0.000101)*sailStates.de;
	Cm = (-14.401626)*sailStates.alpha + (0.090149)*sailStates.beta + (7.263509)*sailStates.p + (-121.885399)*sailStates.q + (-0.055918)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (-0.313899)*sailStates.alpha + (-0.024314)*sailStates.beta + (0.541990)*sailStates.p + (-2.576417)*sailStates.q + (-0.029786)*sailStates.r + (0.000077)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end