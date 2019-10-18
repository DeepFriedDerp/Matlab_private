function [aeroForces] = paramSpace_1_1_1_1_2_2_1(sailStates,airStates)

	CL = (6.837086)*sailStates.alpha + (-0.102724)*sailStates.beta + (-2.426376)*sailStates.p + (33.276863)*sailStates.q + (-1.674950)*sailStates.r + (0.009763)*sailStates.de;
	CD = -1.091290;
	CY = (1.511525)*sailStates.alpha + (-0.052331)*sailStates.beta + (-1.084283)*sailStates.p + (11.775422)*sailStates.q + (-0.143583)*sailStates.r + (0.002497)*sailStates.de;

	Cl = (3.035444)*sailStates.alpha + (-0.043925)*sailStates.beta + (-1.257297)*sailStates.p + (11.399099)*sailStates.q + (-1.069729)*sailStates.r + (0.000272)*sailStates.de;
	Cm = (-20.039955)*sailStates.alpha + (0.195313)*sailStates.beta + (7.542222)*sailStates.p + (-131.237640)*sailStates.q + (5.491896)*sailStates.r + (-0.067719)*sailStates.de;
	Cn = (-1.434989)*sailStates.alpha + (0.038171)*sailStates.beta + (1.924565)*sailStates.p + (-16.804646)*sailStates.q + (0.135515)*sailStates.r + (-0.003458)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end