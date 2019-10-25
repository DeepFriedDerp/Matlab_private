function [aeroForces] = paramSpace_1_2_2_2_1_1_1(sailStates,airStates)

	CL = (4.095207)*sailStates.alpha + (0.146962)*sailStates.beta + (-2.351948)*sailStates.p + (34.448860)*sailStates.q + (-1.031572)*sailStates.r + (0.011041)*sailStates.de;
	CD = -0.083040;
	CY = (-0.038370)*sailStates.alpha + (-0.025563)*sailStates.beta + (-0.304347)*sailStates.p + (-0.513811)*sailStates.q + (-0.040104)*sailStates.r + (-0.000109)*sailStates.de;

	Cl = (1.070139)*sailStates.alpha + (0.215314)*sailStates.beta + (-0.996735)*sailStates.p + (8.100573)*sailStates.q + (-0.797415)*sailStates.r + (-0.000007)*sailStates.de;
	Cm = (-13.778297)*sailStates.alpha + (-0.519343)*sailStates.beta + (7.676517)*sailStates.p + (-130.467148)*sailStates.q + (3.461094)*sailStates.r + (-0.068233)*sailStates.de;
	Cn = (-0.084347)*sailStates.alpha + (0.023052)*sailStates.beta + (0.606665)*sailStates.p + (-2.126134)*sailStates.q + (-0.007895)*sailStates.r + (0.000088)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end