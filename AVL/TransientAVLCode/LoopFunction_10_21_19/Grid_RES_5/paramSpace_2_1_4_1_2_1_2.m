function [aeroForces] = paramSpace_2_1_4_1_2_1_2(sailStates,airStates)

	CL = (5.270638)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.033637)*sailStates.p + (44.527691)*sailStates.q + (-2.793054)*sailStates.r + (0.011951)*sailStates.de;
	CD = -1.034940;
	CY = (-0.025596)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.023943)*sailStates.p + (1.364609)*sailStates.q + (-0.217499)*sailStates.r + (0.000291)*sailStates.de;

	Cl = (2.044610)*sailStates.alpha + (0.457891)*sailStates.beta + (-1.573743)*sailStates.p + (15.160218)*sailStates.q + (-2.264354)*sailStates.r + (0.000915)*sailStates.de;
	Cm = (-12.472027)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.421841)*sailStates.p + (-146.890121)*sailStates.q + (9.187941)*sailStates.r + (-0.068730)*sailStates.de;
	Cn = (0.647732)*sailStates.alpha + (0.097328)*sailStates.beta + (2.021499)*sailStates.p + (-9.053003)*sailStates.q + (0.019016)*sailStates.r + (-0.000595)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end