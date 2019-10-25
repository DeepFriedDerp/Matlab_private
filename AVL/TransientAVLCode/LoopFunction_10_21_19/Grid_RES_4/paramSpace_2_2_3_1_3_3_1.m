function [aeroForces] = paramSpace_2_2_3_1_3_3_1(sailStates,airStates)

	CL = (5.129411)*sailStates.alpha + (0.138192)*sailStates.beta + (-1.607014)*sailStates.p + (25.227346)*sailStates.q + (1.565922)*sailStates.r + (0.010133)*sailStates.de;
	CD = -1.739940;
	CY = (-0.097605)*sailStates.alpha + (-0.025449)*sailStates.beta + (0.743833)*sailStates.p + (1.471503)*sailStates.q + (0.048805)*sailStates.r + (0.000312)*sailStates.de;

	Cl = (0.516237)*sailStates.alpha + (-0.395871)*sailStates.beta + (-0.472752)*sailStates.p + (2.609244)*sailStates.q + (1.594325)*sailStates.r + (-0.000798)*sailStates.de;
	Cm = (-13.716649)*sailStates.alpha + (-0.565478)*sailStates.beta + (6.103827)*sailStates.p + (-112.102478)*sailStates.q + (-5.334396)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (1.387182)*sailStates.alpha + (-0.028716)*sailStates.beta + (-1.731803)*sailStates.p + (6.755197)*sailStates.q + (-0.007119)*sailStates.r + (-0.000299)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end