function [aeroForces] = paramSpace_1_2_1_2_1_2_1(sailStates,airStates)

	CL = (5.674194)*sailStates.alpha + (-0.756567)*sailStates.beta + (-5.821109)*sailStates.p + (53.767532)*sailStates.q + (2.415337)*sailStates.r + (0.010870)*sailStates.de;
	CD = -7.556150;
	CY = (2.500318)*sailStates.alpha + (-0.018126)*sailStates.beta + (1.373399)*sailStates.p + (3.895775)*sailStates.q + (0.181363)*sailStates.r + (0.000881)*sailStates.de;

	Cl = (-0.849284)*sailStates.alpha + (-0.976192)*sailStates.beta + (-3.964004)*sailStates.p + (33.943951)*sailStates.q + (2.618936)*sailStates.r + (0.005100)*sailStates.de;
	Cm = (4.412505)*sailStates.alpha + (3.197529)*sailStates.beta + (21.820400)*sailStates.p + (-232.346329)*sailStates.q + (-8.189007)*sailStates.r + (-0.081247)*sailStates.de;
	Cn = (-9.215058)*sailStates.alpha + (-0.097956)*sailStates.beta + (-3.704194)*sailStates.p + (15.909760)*sailStates.q + (-0.075845)*sailStates.r + (-0.000695)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end