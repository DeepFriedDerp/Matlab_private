function [aeroForces] = paramSpace_2_3_3_1_3_3_1(sailStates,airStates)

	CL = (5.129411)*sailStates.alpha + (-0.138192)*sailStates.beta + (-1.607014)*sailStates.p + (25.227346)*sailStates.q + (1.565922)*sailStates.r + (0.010133)*sailStates.de;
	CD = -1.739940;
	CY = (-0.097605)*sailStates.alpha + (-0.024503)*sailStates.beta + (0.743833)*sailStates.p + (1.471503)*sailStates.q + (0.048805)*sailStates.r + (0.000312)*sailStates.de;

	Cl = (0.451097)*sailStates.alpha + (-0.466225)*sailStates.beta + (-0.440103)*sailStates.p + (2.205364)*sailStates.q + (1.596450)*sailStates.r + (-0.000884)*sailStates.de;
	Cm = (-13.716649)*sailStates.alpha + (0.565478)*sailStates.beta + (6.103828)*sailStates.p + (-112.102478)*sailStates.q + (-5.334395)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (1.420708)*sailStates.alpha + (-0.027789)*sailStates.beta + (-1.729663)*sailStates.p + (6.728725)*sailStates.q + (-0.006980)*sailStates.r + (-0.000299)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end