function [aeroForces] = paramSpace_2_3_2_1_1_2_1(sailStates,airStates)

	CL = (3.855009)*sailStates.alpha + (0.000997)*sailStates.beta + (-1.698922)*sailStates.p + (27.715847)*sailStates.q + (0.221244)*sailStates.r + (0.010634)*sailStates.de;
	CD = -0.015160;
	CY = (-0.318749)*sailStates.alpha + (-0.025727)*sailStates.beta + (0.226696)*sailStates.p + (-1.915493)*sailStates.q + (0.014926)*sailStates.r + (-0.000407)*sailStates.de;

	Cl = (0.657617)*sailStates.alpha + (-0.042150)*sailStates.beta + (-0.479569)*sailStates.p + (2.849057)*sailStates.q + (0.216966)*sailStates.r + (-0.000810)*sailStates.de;
	Cm = (-14.109665)*sailStates.alpha + (-0.019017)*sailStates.beta + (5.996246)*sailStates.p + (-113.694908)*sailStates.q + (-0.714096)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (0.569528)*sailStates.alpha + (-0.001384)*sailStates.beta + (-0.474732)*sailStates.p + (3.610410)*sailStates.q + (-0.014962)*sailStates.r + (0.000585)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end