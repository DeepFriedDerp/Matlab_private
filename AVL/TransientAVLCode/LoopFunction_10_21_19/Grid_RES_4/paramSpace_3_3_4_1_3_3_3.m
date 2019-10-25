function [aeroForces] = paramSpace_3_3_4_1_3_3_3(sailStates,airStates)

	CL = (5.233377)*sailStates.alpha + (-0.192376)*sailStates.beta + (-3.525881)*sailStates.p + (44.727764)*sailStates.q + (2.244694)*sailStates.r + (0.012003)*sailStates.de;
	CD = -1.856200;
	CY = (0.527063)*sailStates.alpha + (-0.025657)*sailStates.beta + (0.910532)*sailStates.p + (1.471503)*sailStates.q + (-0.059524)*sailStates.r + (0.000322)*sailStates.de;

	Cl = (1.239568)*sailStates.alpha + (-0.564734)*sailStates.beta + (-1.943148)*sailStates.p + (16.964687)*sailStates.q + (2.077231)*sailStates.r + (0.001525)*sailStates.de;
	Cm = (-11.277604)*sailStates.alpha + (0.781924)*sailStates.beta + (11.404926)*sailStates.p + (-162.286758)*sailStates.q + (-7.663806)*sailStates.r + (-0.072841)*sailStates.de;
	Cn = (-1.386487)*sailStates.alpha + (0.033743)*sailStates.beta + (-1.958272)*sailStates.p + (7.230811)*sailStates.q + (-0.000061)*sailStates.r + (-0.000247)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end