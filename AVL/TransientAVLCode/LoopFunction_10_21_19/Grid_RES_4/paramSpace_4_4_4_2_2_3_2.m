function [aeroForces] = paramSpace_4_4_4_2_2_3_2(sailStates,airStates)

	CL = (4.415971)*sailStates.alpha + (-0.472579)*sailStates.beta + (-2.537405)*sailStates.p + (38.688259)*sailStates.q + (2.014351)*sailStates.r + (0.011052)*sailStates.de;
	CD = -0.483520;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.710214)*sailStates.p + (-0.000001)*sailStates.q + (-0.141270)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.313615)*sailStates.alpha + (-0.480892)*sailStates.beta + (-1.130963)*sailStates.p + (10.191874)*sailStates.q + (1.646152)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-11.813121)*sailStates.alpha + (1.840002)*sailStates.beta + (7.426093)*sailStates.p + (-133.820877)*sailStates.q + (-6.723645)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.086879)*sailStates.alpha + (0.068142)*sailStates.beta + (-1.414403)*sailStates.p + (5.591916)*sailStates.q + (-0.001664)*sailStates.r + (0.000099)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end