function [aeroForces] = paramSpace_1_2_2_1_3_2_3(sailStates,airStates)

	CL = (3.957376)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.318425)*sailStates.p + (42.729359)*sailStates.q + (-1.616439)*sailStates.r + (0.011191)*sailStates.de;
	CD = -0.034080;
	CY = (0.091785)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.559039)*sailStates.p + (2.260756)*sailStates.q + (-0.098574)*sailStates.r + (0.000488)*sailStates.de;

	Cl = (1.658791)*sailStates.alpha + (0.189339)*sailStates.beta + (-1.852197)*sailStates.p + (16.695471)*sailStates.q + (-1.207271)*sailStates.r + (0.001388)*sailStates.de;
	Cm = (-13.430526)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.606193)*sailStates.p + (-157.393341)*sailStates.q + (5.383212)*sailStates.r + (-0.070740)*sailStates.de;
	Cn = (0.509099)*sailStates.alpha + (0.033386)*sailStates.beta + (0.903985)*sailStates.p + (-4.554996)*sailStates.q + (0.004109)*sailStates.r + (-0.000736)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end