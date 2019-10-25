function [aeroForces] = paramSpace_1_3_1_1_1_3_3(sailStates,airStates)

	CL = (6.206658)*sailStates.alpha + (-0.293194)*sailStates.beta + (-3.236642)*sailStates.p + (34.999249)*sailStates.q + (1.481460)*sailStates.r + (0.009544)*sailStates.de;
	CD = -2.469150;
	CY = (0.263114)*sailStates.alpha + (-0.027824)*sailStates.beta + (0.992227)*sailStates.p + (-1.081942)*sailStates.q + (0.175059)*sailStates.r + (-0.000233)*sailStates.de;

	Cl = (2.427352)*sailStates.alpha + (-0.528469)*sailStates.beta + (-1.808239)*sailStates.p + (14.081667)*sailStates.q + (1.563224)*sailStates.r + (0.001467)*sailStates.de;
	Cm = (-15.818053)*sailStates.alpha + (1.088705)*sailStates.beta + (12.865804)*sailStates.p + (-160.704956)*sailStates.q + (-4.791738)*sailStates.r + (-0.070299)*sailStates.de;
	Cn = (-0.672447)*sailStates.alpha + (-0.061704)*sailStates.beta + (-2.529303)*sailStates.p + (13.494305)*sailStates.q + (-0.114414)*sailStates.r + (0.000569)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end