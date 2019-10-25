function [aeroForces] = paramSpace_2_1_3_2_2_1_3(sailStates,airStates)

	CL = (4.455987)*sailStates.alpha + (-0.300778)*sailStates.beta + (-2.975801)*sailStates.p + (39.160866)*sailStates.q + (-1.388236)*sailStates.r + (0.011331)*sailStates.de;
	CD = -0.473620;
	CY = (-0.080763)*sailStates.alpha + (-0.024883)*sailStates.beta + (-0.560716)*sailStates.p + (0.100923)*sailStates.q + (-0.036748)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.571313)*sailStates.alpha + (0.181725)*sailStates.beta + (-1.584648)*sailStates.p + (13.683744)*sailStates.q + (-1.205354)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-13.800307)*sailStates.alpha + (1.129763)*sailStates.beta + (9.810249)*sailStates.p + (-147.195892)*sailStates.q + (4.691990)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (0.294573)*sailStates.alpha + (0.019025)*sailStates.beta + (1.169405)*sailStates.p + (-5.076729)*sailStates.q + (0.004428)*sailStates.r + (-0.000144)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end