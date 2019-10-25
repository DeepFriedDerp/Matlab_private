function [aeroForces] = paramSpace_12_1_3_1_1_2_1(sailStates,airStates)

	CL = (5.234213)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.078213)*sailStates.p + (34.377533)*sailStates.q + (2.109945)*sailStates.r + (0.011260)*sailStates.de;
	CD = -1.011220;
	CY = (-0.284879)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.879888)*sailStates.p + (-0.696926)*sailStates.q + (-0.123685)*sailStates.r + (-0.000148)*sailStates.de;

	Cl = (1.547261)*sailStates.alpha + (-0.411991)*sailStates.beta + (-0.787540)*sailStates.p + (6.871864)*sailStates.q + (1.788129)*sailStates.r + (-0.000363)*sailStates.de;
	Cm = (-12.985692)*sailStates.alpha + (0.000000)*sailStates.beta + (6.005838)*sailStates.p + (-121.395615)*sailStates.q + (-7.074562)*sailStates.r + (-0.067712)*sailStates.de;
	Cn = (1.046391)*sailStates.alpha + (0.057902)*sailStates.beta + (-1.877137)*sailStates.p + (8.744712)*sailStates.q + (0.028055)*sailStates.r + (0.000330)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end