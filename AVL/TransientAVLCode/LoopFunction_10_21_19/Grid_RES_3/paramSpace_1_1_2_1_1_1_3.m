function [aeroForces] = paramSpace_1_1_2_1_1_1_3(sailStates,airStates)

	CL = (5.066893)*sailStates.alpha + (-0.610588)*sailStates.beta + (-3.541581)*sailStates.p + (49.061298)*sailStates.q + (-2.995745)*sailStates.r + (0.012486)*sailStates.de;
	CD = -1.870540;
	CY = (-0.554434)*sailStates.alpha + (-0.022105)*sailStates.beta + (-1.060596)*sailStates.p + (-1.081943)*sailStates.q + (-0.187012)*sailStates.r + (-0.000233)*sailStates.de;

	Cl = (1.188431)*sailStates.alpha + (0.387068)*sailStates.beta + (-1.989500)*sailStates.p + (18.868078)*sailStates.q + (-2.591989)*sailStates.r + (0.001699)*sailStates.de;
	Cm = (-8.926205)*sailStates.alpha + (2.319058)*sailStates.beta + (10.258101)*sailStates.p + (-160.704926)*sailStates.q + (9.997267)*sailStates.r + (-0.070299)*sailStates.de;
	Cn = (1.828104)*sailStates.alpha + (0.099291)*sailStates.beta + (2.126973)*sailStates.p + (-7.447232)*sailStates.q + (-0.020139)*sailStates.r + (0.000078)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end