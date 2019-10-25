function [aeroForces] = paramSpace_4_2_1_1_1_1_1(sailStates,airStates)

	CL = (4.790748)*sailStates.alpha + (-0.111780)*sailStates.beta + (-1.409450)*sailStates.p + (20.287838)*sailStates.q + (-1.192798)*sailStates.r + (0.008826)*sailStates.de;
	CD = -1.645770;
	CY = (0.147208)*sailStates.alpha + (-0.025938)*sailStates.beta + (-0.672358)*sailStates.p + (-1.002333)*sailStates.q + (0.133848)*sailStates.r + (-0.000209)*sailStates.de;

	Cl = (0.416292)*sailStates.alpha + (0.346817)*sailStates.beta + (-0.395377)*sailStates.p + (1.357349)*sailStates.q + (-1.373087)*sailStates.r + (-0.000843)*sailStates.de;
	Cm = (-15.159574)*sailStates.alpha + (0.472948)*sailStates.beta + (6.333734)*sailStates.p + (-108.591942)*sailStates.q + (3.912211)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (-1.372043)*sailStates.alpha + (-0.076433)*sailStates.beta + (1.597258)*sailStates.p + (-6.290348)*sailStates.q + (-0.029489)*sailStates.r + (0.000171)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end