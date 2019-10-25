function [aeroForces] = paramSpace_15_1_2_1_1_1_1(sailStates,airStates)

	CL = (3.996356)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.795758)*sailStates.p + (25.773081)*sailStates.q + (-0.098637)*sailStates.r + (0.009129)*sailStates.de;
	CD = -0.425180;
	CY = (0.001190)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.248749)*sailStates.p + (-0.476205)*sailStates.q + (0.062037)*sailStates.r + (-0.000099)*sailStates.de;

	Cl = (0.809997)*sailStates.alpha + (0.143092)*sailStates.beta + (-0.682446)*sailStates.p + (4.654672)*sailStates.q + (-0.384211)*sailStates.r + (-0.000383)*sailStates.de;
	Cm = (-14.845652)*sailStates.alpha + (0.000000)*sailStates.beta + (6.962396)*sailStates.p + (-118.206032)*sailStates.q + (0.223624)*sailStates.r + (-0.064943)*sailStates.de;
	Cn = (-0.463247)*sailStates.alpha + (-0.035677)*sailStates.beta + (0.713254)*sailStates.p + (-3.120017)*sailStates.q + (-0.039697)*sailStates.r + (0.000075)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end