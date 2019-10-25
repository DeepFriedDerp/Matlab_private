function [aeroForces] = paramSpace_3_3_2_3_3_1_2(sailStates,airStates)

	CL = (4.304847)*sailStates.alpha + (0.037195)*sailStates.beta + (-2.554770)*sailStates.p + (34.152332)*sailStates.q + (-0.453472)*sailStates.r + (0.010900)*sailStates.de;
	CD = -0.203470;
	CY = (0.060961)*sailStates.alpha + (-0.025136)*sailStates.beta + (-0.320742)*sailStates.p + (0.498141)*sailStates.q + (0.021005)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.333746)*sailStates.alpha + (0.150144)*sailStates.beta + (-1.189509)*sailStates.p + (9.369415)*sailStates.q + (-0.501152)*sailStates.r + (0.000312)*sailStates.de;
	Cm = (-15.168687)*sailStates.alpha + (-0.158539)*sailStates.beta + (8.960443)*sailStates.p + (-137.428818)*sailStates.q + (1.541088)*sailStates.r + (-0.070088)*sailStates.de;
	Cn = (-0.249467)*sailStates.alpha + (-0.008528)*sailStates.beta + (0.765912)*sailStates.p + (-4.024366)*sailStates.q + (-0.012259)*sailStates.r + (-0.000201)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end