function [aeroForces] = paramSpace_2_3_4_1_3_1_3(sailStates,airStates)

	CL = (7.320872)*sailStates.alpha + (0.211028)*sailStates.beta + (-3.492796)*sailStates.p + (44.864292)*sailStates.q + (-3.098737)*sailStates.r + (0.012087)*sailStates.de;
	CD = -2.955220;
	CY = (-0.260835)*sailStates.alpha + (-0.024496)*sailStates.beta + (-1.412493)*sailStates.p + (1.915495)*sailStates.q + (-0.092377)*sailStates.r + (0.000419)*sailStates.de;

	Cl = (3.016717)*sailStates.alpha + (0.696210)*sailStates.beta + (-1.922378)*sailStates.p + (17.021620)*sailStates.q + (-2.725734)*sailStates.r + (0.001446)*sailStates.de;
	Cm = (-14.523398)*sailStates.alpha + (-0.781696)*sailStates.beta + (11.027772)*sailStates.p + (-160.694275)*sailStates.q + (10.439165)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (1.434166)*sailStates.alpha + (0.039735)*sailStates.beta + (3.015344)*sailStates.p + (-14.801892)*sailStates.q + (0.026745)*sailStates.r + (-0.000878)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end