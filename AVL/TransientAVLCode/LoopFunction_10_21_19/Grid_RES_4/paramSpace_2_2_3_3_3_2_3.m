function [aeroForces] = paramSpace_2_2_3_3_3_2_3(sailStates,airStates)

	CL = (4.062100)*sailStates.alpha + (-0.027239)*sailStates.beta + (-2.822015)*sailStates.p + (37.096592)*sailStates.q + (-0.493224)*sailStates.r + (0.011184)*sailStates.de;
	CD = 0.019720;
	CY = (0.053662)*sailStates.alpha + (-0.025157)*sailStates.beta + (-0.159187)*sailStates.p + (0.563442)*sailStates.q + (-0.010414)*sailStates.r + (0.000122)*sailStates.de;

	Cl = (1.397552)*sailStates.alpha + (0.045755)*sailStates.beta + (-1.433892)*sailStates.p + (11.969552)*sailStates.q + (-0.351848)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.629552)*sailStates.alpha + (0.087267)*sailStates.beta + (9.569928)*sailStates.p + (-144.107025)*sailStates.q + (1.652567)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (0.022151)*sailStates.alpha + (0.003798)*sailStates.beta + (0.262716)*sailStates.p + (-1.349170)*sailStates.q + (0.000256)*sailStates.r + (-0.000192)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end