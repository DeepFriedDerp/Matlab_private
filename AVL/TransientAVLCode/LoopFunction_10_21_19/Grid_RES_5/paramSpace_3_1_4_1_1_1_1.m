function [aeroForces] = paramSpace_3_1_4_1_1_1_1(sailStates,airStates)

	CL = (4.480861)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.120647)*sailStates.p + (34.930824)*sailStates.q + (-1.738853)*sailStates.r + (0.011443)*sailStates.de;
	CD = -0.585910;
	CY = (-0.052144)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.566136)*sailStates.p + (-1.304043)*sailStates.q + (-0.099964)*sailStates.r + (-0.000275)*sailStates.de;

	Cl = (0.909189)*sailStates.alpha + (0.335098)*sailStates.beta + (-0.812006)*sailStates.p + (7.033498)*sailStates.q + (-1.425151)*sailStates.r + (-0.000257)*sailStates.de;
	Cm = (-11.995016)*sailStates.alpha + (0.000000)*sailStates.beta + (6.251509)*sailStates.p + (-122.917580)*sailStates.q + (5.789410)*sailStates.r + (-0.067165)*sailStates.de;
	Cn = (-0.475770)*sailStates.alpha + (0.059087)*sailStates.beta + (1.233259)*sailStates.p + (-4.412806)*sailStates.q + (-0.008610)*sailStates.r + (0.000266)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end