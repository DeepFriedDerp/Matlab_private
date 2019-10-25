function [aeroForces] = paramSpace_12_1_2_1_1_2_2(sailStates,airStates)

	CL = (5.259177)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.082570)*sailStates.p + (42.661449)*sailStates.q + (2.385037)*sailStates.r + (0.011821)*sailStates.de;
	CD = -1.028840;
	CY = (0.033036)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.952583)*sailStates.p + (-1.241892)*sailStates.q + (-0.133833)*sailStates.r + (-0.000268)*sailStates.de;

	Cl = (2.021772)*sailStates.alpha + (-0.426475)*sailStates.beta + (-1.609576)*sailStates.p + (14.622792)*sailStates.q + (1.996373)*sailStates.r + (0.000962)*sailStates.de;
	Cm = (-13.437333)*sailStates.alpha + (0.000000)*sailStates.beta + (9.316232)*sailStates.p + (-149.211060)*sailStates.q + (-7.972275)*sailStates.r + (-0.070499)*sailStates.de;
	Cn = (-0.523391)*sailStates.alpha + (0.059937)*sailStates.beta + (-1.920375)*sailStates.p + (8.877420)*sailStates.q + (0.021030)*sailStates.r + (0.000542)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end