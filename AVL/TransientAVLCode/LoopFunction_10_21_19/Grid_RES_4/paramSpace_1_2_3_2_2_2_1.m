function [aeroForces] = paramSpace_1_2_3_2_2_2_1(sailStates,airStates)

	CL = (3.844529)*sailStates.alpha + (-0.058181)*sailStates.beta + (-2.093017)*sailStates.p + (31.955315)*sailStates.q + (-0.826548)*sailStates.r + (0.010495)*sailStates.de;
	CD = 0.055430;
	CY = (-0.009197)*sailStates.alpha + (-0.024666)*sailStates.beta + (-0.166663)*sailStates.p + (-0.301044)*sailStates.q + (-0.033162)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.005097)*sailStates.alpha + (0.078638)*sailStates.beta + (-0.860985)*sailStates.p + (7.041382)*sailStates.q + (-0.541282)*sailStates.r + (-0.000134)*sailStates.de;
	Cm = (-13.639501)*sailStates.alpha + (0.201531)*sailStates.beta + (6.924806)*sailStates.p + (-123.990753)*sailStates.q + (2.773291)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (-0.000877)*sailStates.alpha + (0.018064)*sailStates.beta + (0.257937)*sailStates.p + (-0.556886)*sailStates.q + (-0.022314)*sailStates.r + (0.000065)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end