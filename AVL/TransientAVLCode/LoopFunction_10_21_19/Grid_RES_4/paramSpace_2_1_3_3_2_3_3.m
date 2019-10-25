function [aeroForces] = paramSpace_2_1_3_3_2_3_3(sailStates,airStates)

	CL = (4.130929)*sailStates.alpha + (0.089082)*sailStates.beta + (-2.790468)*sailStates.p + (36.022137)*sailStates.q + (0.291903)*sailStates.r + (0.010859)*sailStates.de;
	CD = -0.151490;
	CY = (0.032847)*sailStates.alpha + (-0.024849)*sailStates.beta + (0.230200)*sailStates.p + (0.065299)*sailStates.q + (0.015090)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.435654)*sailStates.alpha + (-0.098837)*sailStates.beta + (-1.454957)*sailStates.p + (12.082550)*sailStates.q + (0.364486)*sailStates.r + (0.000811)*sailStates.de;
	Cm = (-14.653869)*sailStates.alpha + (-0.398714)*sailStates.beta + (9.705425)*sailStates.p + (-143.297119)*sailStates.q + (-1.001997)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (0.040959)*sailStates.alpha + (-0.009064)*sailStates.beta + (-0.597819)*sailStates.p + (2.942967)*sailStates.q + (-0.009088)*sailStates.r + (0.000026)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end