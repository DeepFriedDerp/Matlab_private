function [aeroForces] = paramSpace_4_1_2_2_1_1_1(sailStates,airStates)

	CL = (4.086030)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.357787)*sailStates.p + (34.734695)*sailStates.q + (-1.087362)*sailStates.r + (0.011022)*sailStates.de;
	CD = -0.081950;
	CY = (-0.036746)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.335452)*sailStates.p + (-0.520429)*sailStates.q + (-0.047126)*sailStates.r + (-0.000111)*sailStates.de;

	Cl = (1.123070)*sailStates.alpha + (0.188600)*sailStates.beta + (-1.031297)*sailStates.p + (8.570539)*sailStates.q + (-0.866006)*sailStates.r + (0.000082)*sailStates.de;
	Cm = (-13.571733)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.652573)*sailStates.p + (-130.856766)*sailStates.q + (3.674659)*sailStates.r + (-0.068597)*sailStates.de;
	Cn = (-0.063855)*sailStates.alpha + (0.026506)*sailStates.beta + (0.648846)*sailStates.p + (-2.117596)*sailStates.q + (-0.010213)*sailStates.r + (0.000102)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end