function [aeroForces] = paramSpace_5_1_2_1_2_2_2(sailStates,airStates)

	CL = (4.320425)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.989514)*sailStates.p + (36.857716)*sailStates.q + (0.387417)*sailStates.r + (0.010714)*sailStates.de;
	CD = -0.482090;
	CY = (0.203448)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.285614)*sailStates.p + (1.178225)*sailStates.q + (0.029978)*sailStates.r + (0.000256)*sailStates.de;

	Cl = (1.368550)*sailStates.alpha + (-0.190268)*sailStates.beta + (-1.587855)*sailStates.p + (13.072111)*sailStates.q + (0.528170)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-14.595066)*sailStates.alpha + (0.000000)*sailStates.beta + (10.603944)*sailStates.p + (-150.099487)*sailStates.q + (-1.301851)*sailStates.r + (-0.071133)*sailStates.de;
	Cn = (-0.158124)*sailStates.alpha + (-0.019998)*sailStates.beta + (-0.835982)*sailStates.p + (3.535010)*sailStates.q + (-0.014761)*sailStates.r + (-0.000254)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end