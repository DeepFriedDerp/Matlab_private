function [aeroForces] = paramSpace_1_1_1_2_3_3_1(sailStates,airStates)

	CL = (3.942667)*sailStates.alpha + (0.017356)*sailStates.beta + (-2.005222)*sailStates.p + (28.673807)*sailStates.q + (0.078443)*sailStates.r + (0.009687)*sailStates.de;
	CD = -0.221080;
	CY = (0.028037)*sailStates.alpha + (-0.026191)*sailStates.beta + (0.176054)*sailStates.p + (0.491415)*sailStates.q + (0.030996)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.020409)*sailStates.alpha + (-0.099320)*sailStates.beta + (-0.853902)*sailStates.p + (6.483452)*sailStates.q + (0.262450)*sailStates.r + (-0.000110)*sailStates.de;
	Cm = (-14.391674)*sailStates.alpha + (-0.045515)*sailStates.beta + (7.340801)*sailStates.p + (-122.751343)*sailStates.q + (-0.198683)*sailStates.r + (-0.066320)*sailStates.de;
	Cn = (0.309357)*sailStates.alpha + (-0.021765)*sailStates.beta + (-0.552486)*sailStates.p + (2.622627)*sailStates.q + (-0.024690)*sailStates.r + (-0.000080)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end