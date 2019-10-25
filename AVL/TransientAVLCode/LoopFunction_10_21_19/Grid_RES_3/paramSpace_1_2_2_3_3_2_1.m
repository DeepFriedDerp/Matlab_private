function [aeroForces] = paramSpace_1_2_2_3_3_2_1(sailStates,airStates)

	CL = (3.958825)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.236840)*sailStates.p + (33.184216)*sailStates.q + (-0.917054)*sailStates.r + (0.010627)*sailStates.de;
	CD = 0.039370;
	CY = (0.068336)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.249096)*sailStates.p + (0.318253)*sailStates.q + (-0.043922)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.128057)*sailStates.alpha + (0.111853)*sailStates.beta + (-0.959247)*sailStates.p + (7.931300)*sailStates.q + (-0.634537)*sailStates.r + (-0.000027)*sailStates.de;
	Cm = (-13.888827)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.343117)*sailStates.p + (-127.854218)*sailStates.q + (3.076749)*sailStates.r + (-0.067624)*sailStates.de;
	Cn = (-0.086393)*sailStates.alpha + (0.019723)*sailStates.beta + (0.417321)*sailStates.p + (-1.678580)*sailStates.q + (-0.008477)*sailStates.r + (-0.000120)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end