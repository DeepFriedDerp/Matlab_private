function [aeroForces] = paramSpace_2_2_2_1_1_1_2(sailStates,airStates)

	CL = (5.240139)*sailStates.alpha + (-3.986680)*sailStates.beta + (-3.452461)*sailStates.p + (47.474174)*sailStates.q + (2.221108)*sailStates.r + (0.010394)*sailStates.de;
	CD = -5.999550;
	CY = (1.784642)*sailStates.alpha + (-0.272676)*sailStates.beta + (0.334392)*sailStates.p + (15.498134)*sailStates.q + (-0.033047)*sailStates.r + (0.002951)*sailStates.de;

	Cl = (-5.545484)*sailStates.alpha + (-1.253804)*sailStates.beta + (-1.674889)*sailStates.p + (14.236353)*sailStates.q + (2.478809)*sailStates.r + (0.001228)*sailStates.de;
	Cm = (5.917795)*sailStates.alpha + (18.243044)*sailStates.beta + (10.725559)*sailStates.p + (-151.489410)*sailStates.q + (-7.914286)*sailStates.r + (-0.055291)*sailStates.de;
	Cn = (-1.844006)*sailStates.alpha + (0.388038)*sailStates.beta + (-0.943608)*sailStates.p + (-8.716331)*sailStates.q + (-0.202452)*sailStates.r + (-0.003884)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end