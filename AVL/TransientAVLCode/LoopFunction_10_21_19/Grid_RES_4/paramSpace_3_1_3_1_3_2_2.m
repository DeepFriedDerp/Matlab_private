function [aeroForces] = paramSpace_3_1_3_1_3_2_2(sailStates,airStates)

	CL = (4.065622)*sailStates.alpha + (0.018519)*sailStates.beta + (-2.564047)*sailStates.p + (34.617588)*sailStates.q + (-0.107002)*sailStates.r + (0.010861)*sailStates.de;
	CD = -0.009340;
	CY = (0.206997)*sailStates.alpha + (-0.022800)*sailStates.beta + (-0.191320)*sailStates.p + (1.693497)*sailStates.q + (0.012599)*sailStates.r + (0.000363)*sailStates.de;

	Cl = (1.372828)*sailStates.alpha + (0.020547)*sailStates.beta + (-1.258239)*sailStates.p + (10.287195)*sailStates.q + (-0.119276)*sailStates.r + (0.000506)*sailStates.de;
	Cm = (-14.699849)*sailStates.alpha + (-0.109694)*sailStates.beta + (8.882741)*sailStates.p + (-136.946671)*sailStates.q + (0.329691)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (-0.321047)*sailStates.alpha + (-0.004880)*sailStates.beta + (0.453444)*sailStates.p + (-3.606001)*sailStates.q + (-0.016615)*sailStates.r + (-0.000523)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end