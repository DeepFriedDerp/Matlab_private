function [aeroForces] = paramSpace_2_1_1_2_2_2_1(sailStates,airStates)

	CL = (4.095207)*sailStates.alpha + (0.146962)*sailStates.beta + (-2.351948)*sailStates.p + (34.448860)*sailStates.q + (1.031572)*sailStates.r + (0.011041)*sailStates.de;
	CD = -0.083040;
	CY = (0.038370)*sailStates.alpha + (-0.024246)*sailStates.beta + (0.304347)*sailStates.p + (0.513811)*sailStates.q + (-0.040104)*sailStates.r + (0.000109)*sailStates.de;

	Cl = (1.170643)*sailStates.alpha + (-0.127962)*sailStates.beta + (-1.061140)*sailStates.p + (8.902375)*sailStates.q + (0.805838)*sailStates.r + (0.000165)*sailStates.de;
	Cm = (-13.778297)*sailStates.alpha + (-0.519343)*sailStates.beta + (7.676517)*sailStates.p + (-130.467148)*sailStates.q + (-3.461094)*sailStates.r + (-0.068233)*sailStates.de;
	Cn = (0.040471)*sailStates.alpha + (0.022141)*sailStates.beta + (-0.598185)*sailStates.p + (2.020575)*sailStates.q + (-0.009004)*sailStates.r + (-0.000088)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end