function [aeroForces] = paramSpace_1_3_3_2_1_1_3(sailStates,airStates)

	CL = (4.180447)*sailStates.alpha + (0.142722)*sailStates.beta + (-2.967529)*sailStates.p + (42.038002)*sailStates.q + (-1.966823)*sailStates.r + (0.011601)*sailStates.de;
	CD = -0.365110;
	CY = (-0.167481)*sailStates.alpha + (-0.025445)*sailStates.beta + (-0.610739)*sailStates.p + (-0.455226)*sailStates.q + (-0.121500)*sailStates.r + (-0.000097)*sailStates.de;

	Cl = (1.266533)*sailStates.alpha + (0.367021)*sailStates.beta + (-1.503846)*sailStates.p + (13.681696)*sailStates.q + (-1.579474)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-11.944548)*sailStates.alpha + (-0.522845)*sailStates.beta + (9.018191)*sailStates.p + (-146.782669)*sailStates.q + (6.542582)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (0.506619)*sailStates.alpha + (0.065026)*sailStates.beta + (1.150032)*sailStates.p + (-3.854358)*sailStates.q + (-0.025916)*sailStates.r + (0.000011)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end