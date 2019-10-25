function [aeroForces] = paramSpace_1_1_1_1_2_2_2(sailStates,airStates)

	CL = (1.812251)*sailStates.alpha + (0.017990)*sailStates.beta + (-4.965695)*sailStates.p + (51.843182)*sailStates.q + (-0.183945)*sailStates.r + (0.011093)*sailStates.de;
	CD = -0.767580;
	CY = (0.492712)*sailStates.alpha + (-0.027408)*sailStates.beta + (0.251646)*sailStates.p + (1.768060)*sailStates.q + (0.044204)*sailStates.r + (0.000394)*sailStates.de;

	Cl = (0.229400)*sailStates.alpha + (-0.215310)*sailStates.beta + (-3.272951)*sailStates.p + (28.974440)*sailStates.q + (0.121527)*sailStates.r + (0.003969)*sailStates.de;
	Cm = (-5.001308)*sailStates.alpha + (-0.081079)*sailStates.beta + (17.632929)*sailStates.p + (-207.227753)*sailStates.q + (0.720985)*sailStates.r + (-0.077218)*sailStates.de;
	Cn = (-1.523821)*sailStates.alpha + (-0.040190)*sailStates.beta + (-1.192217)*sailStates.p + (6.631863)*sailStates.q + (-0.086959)*sailStates.r + (-0.000350)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end