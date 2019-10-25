function [aeroForces] = paramSpace_9_1_4_1_2_1_2(sailStates,airStates)

	CL = (4.986594)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.076157)*sailStates.p + (38.269653)*sailStates.q + (-1.307559)*sailStates.r + (0.011167)*sailStates.de;
	CD = -0.879900;
	CY = (-0.034690)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.690619)*sailStates.p + (0.910009)*sailStates.q + (0.024213)*sailStates.r + (0.000199)*sailStates.de;

	Cl = (1.866229)*sailStates.alpha + (0.308474)*sailStates.beta + (-1.628885)*sailStates.p + (13.427227)*sailStates.q + (-1.219396)*sailStates.r + (0.001040)*sailStates.de;
	Cm = (-15.118198)*sailStates.alpha + (0.000000)*sailStates.beta + (10.741030)*sailStates.p + (-151.817017)*sailStates.q + (4.399021)*sailStates.r + (-0.071941)*sailStates.de;
	Cn = (0.172530)*sailStates.alpha + (-0.010772)*sailStates.beta + (1.588807)*sailStates.p + (-8.221633)*sailStates.q + (-0.011282)*sailStates.r + (-0.000432)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end